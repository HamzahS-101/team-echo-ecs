variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "create_zone" {
  description = "Whether to create a Route 53 hosted zone"
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
}

variable "zone_id" {
  description = "ID of an existing Route 53 hosted zone to use when create_zone is false"
  type        = string
  default     = ""
}

variable "zone_comment" {
  description = "Comment for the hosted zone"
  type        = string
  default     = "Managed by Terraform"
}

variable "force_destroy" {
  description = "Set to true to destroy all records in the zone when destroying the zone"
  type        = bool
  default     = false
}

variable "records" {
  description = "List of DNS records to create"
  type = list(object({
    name    = string
    type    = string
    ttl     = optional(number)
    records = optional(list(string))
    alias = optional(object({
      name                   = string
      zone_id                = string
      evaluate_target_health = optional(bool)
    }))
  }))
  default = []
}

variable "default_ttl" {
  description = "Default TTL for DNS records when not specified"
  type        = number
  default     = 300
}

variable "create_health_check" {
  description = "Whether to create a Route 53 health check"
  type        = bool
  default     = false
}

variable "health_check_fqdn" {
  description = "FQDN for the Route 53 health check"
  type        = string
  default     = ""
}

variable "health_check_port" {
  description = "Port to use for the health check"
  type        = number
  default     = 80
}

variable "health_check_type" {
  description = "Type of health check (e.g., HTTP, HTTPS, TCP)"
  type        = string
  default     = "HTTP"
}

variable "health_check_resource_path" {
  description = "Path to ping on the health check (e.g., /health)"
  type        = string
  default     = "/"
}

variable "health_check_failure_threshold" {
  description = "Number of consecutive health check failures required before considering unhealthy"
  type        = number
  default     = 3
}

variable "health_check_request_interval" {
  description = "Time between health checks in seconds"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}