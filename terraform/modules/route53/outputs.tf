output "zone_id" {
  description = "The ID of the Route 53 hosted zone"
  value       = var.create_zone ? aws_route53_zone.hosted_zone[0].zone_id : var.zone_id
}

output "zone_name" {
  description = "The name of the Route 53 hosted zone"
  value       = var.domain_name
}

output "record_fqdns" {
  description = "Map of record names and their FQDNs"
  value = {
    for k, r in aws_route53_record.record :
    k => r.fqdn
  }
}

output "health_check_id" {
  description = "The ID of the health check (if created)"
  value       = var.create_health_check ? aws_route53_health_check.this[0].id : null
}