variable "domain_name" {
  type        = string
  description = "Domain name for the ACM certificate (e.g., app.example.com)."
}

variable "hosted_zone_domain" {
  type        = string
  description = "Domain name of the Route 53 hosted zone (e.g., example.com)."
}

variable "record_name" {
  type        = string
  description = "Subdomain or full domain to be created in Route 53 (e.g., app.example.com)."
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the ALB (e.g., from module.alb.alb_dns_name)."
}

variable "alb_zone_id" {
  type        = string
  description = "The AWS-managed hosted zone ID associated with the ALB, required for creating Route 53 alias records."
}
