output "zone_id" {
  description = "The Route 53 hosted zone ID"
  value       = var.create_zone ? aws_route53_zone.hosted_zone[0].zone_id : var.zone_id
}

output "zone_name" {
  description = "The domain name of the hosted zone"
  value       = var.domain_name
}

output "acm_certificate_arn" {
  description = "ARN of the ACM certificate (if created)"
  value       = var.create_acm_certificate ? aws_acm_certificate.cert[0].arn : null
}

output "alias_record_fqdns" {
  description = "Alias record FQDNs (e.g., ALB or CloudFront targets)"
  value = {
    for k, r in aws_route53_record.alias_records : k => r.fqdn
  }
}