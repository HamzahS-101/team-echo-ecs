output "acm_certificate_arn" {
  value       = aws_acm_certificate_validation.cert_validation.certificate_arn
  description = "Validated ACM certificate ARN for use with HTTPS-enabled ALB."
}
