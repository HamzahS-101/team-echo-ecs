provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}

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

resource "aws_acm_certificate" "cert" {
  count                     = var.create_acm_certificate ? 1 : 0
  domain_name               = var.acm_domain_name
  validation_method         = "DNS"
  subject_alternative_names = var.acm_san_list
  provider                  = aws.acm_provider

  tags = merge(
    var.tags,
    {
      Name = "${var.acm_domain_name} SSL Certificate"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = var.create_acm_certificate ? {
    for dvo in aws_acm_certificate.cert[0].domain_validation_options :
    dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  } : {}

  zone_id = var.create_zone ? aws_route53_zone.hosted_zone[0].zone_id : var.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 300
  records = [each.value.value]
}

resource "aws_acm_certificate_validation" "cert" {
  count                   = var.create_acm_certificate ? 1 : 0
  certificate_arn         = aws_acm_certificate.cert[0].arn
  validation_record_fqdns = [for r in aws_route53_record.cert_validation : r.fqdn]
  provider                = aws.acm_provider
}

resource "aws_route53_record" "alias_records" {
  for_each = {
    for record in var.alias_records : "${record.name}_${record.alias.name}" => record
  }

  zone_id = var.create_zone ? aws_route53_zone.hosted_zone[0].zone_id : var.zone_id
  name    = each.value.name
  type    = "A"

  alias {
    name                   = each.value.alias.name
    zone_id                = each.value.alias.zone_id
    evaluate_target_health = try(each.value.alias.evaluate_target_health, false)
  }
}