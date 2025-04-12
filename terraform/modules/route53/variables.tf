variable "create_zone" {
  description = "Whether to create the Route 53 hosted zone"
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "The domain name to manage (e.g., echo.hamzahsahal.com)"
  type        = string
}

variable "zone_id" {
  description = "If not creating a zone, provide an existing hosted zone ID"
  type        = string
  default     = ""
}

variable "zone_comment" {
  description = "Comment for the hosted zone"
  type        = string
  default     = "Managed by Terraform"
}

variable "force_destroy" {
  description = "Force destroy all records in the zone upon deletion"
  type        = bool
  default     = false
}

variable "create_acm_certificate" {
  description = "Whether to request an ACM certificate"
  type        = bool
  default     = false
}

variable "acm_domain_name" {
  description = "Primary domain for the ACM certificate (e.g., app.echo.hamzahsahal.com)"
  type        = string
  default     = ""
}

variable "acm_san_list" {
  description = "Optional Subject Alternative Names (SANs) for the ACM certificate"
  type        = list(string)
  default     = []
}

variable "alias_records" {
  description = "Optional alias records (e.g., for ALBs or CloudFront)"
  type = list(object({
    name  = string
    alias = object({
      name                   = string
      zone_id                = string
      evaluate_target_health = optional(bool)
    })
  }))
  default = []
}

variable "tags" {
  description = "Map of tags to apply to all resources"
  type        = map(string)
  default     = {}
}