resource "aws_route53_zone" "hosted_zone" {
  count         = var.create_zone ? 1 : 0
  name          = var.domain_name
  comment       = var.zone_comment
  force_destroy = var.force_destroy

  tags = merge(
    var.tags,
    {
      Name = var.domain_name
    }
  )
}

resource "aws_route53_record" "record" {
  for_each = { for r in var.records : "${r.name}_${r.type}" => r }

  zone_id = var.create_zone ? aws_route53_zone.hosted_zone[0].zone_id : var.zone_id
  name    = each.value.name != "" ? "${each.value.name}.${var.domain_name}" : var.domain_name
  type    = each.value.type
  ttl     = try(each.value.ttl, var.default_ttl)
  records = try(each.value.records, [])

  dynamic "alias" {
    for_each = each.value.alias != null ? [each.value.alias] : []
    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = try(alias.value.evaluate_target_health, false)
    }
  }
}

resource "aws_route53_health_check" "this" {
  count = var.create_health_check ? 1 : 0

  fqdn              = var.health_check_fqdn
  port              = var.health_check_port
  type              = var.health_check_type
  resource_path     = var.health_check_resource_path
  failure_threshold = var.health_check_failure_threshold
  request_interval  = var.health_check_request_interval
}