variable "alb_name" {
  type        = string
  description = "Name of the ALB."
  default     = "dev-alb"
}

variable "alb_security_group_name" {
  type        = string
  description = "Name of the security group for the ALB."
  default     = "alb-sg"
}

variable "target_security_group_name" {
  type        = string
  description = "Name of the SG for the TG."
  default     = "tg-sg"
}

variable "alb_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the ALB."
  default     = ["subnet-abc123", "subnet-def456"]
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC for the TG."
  default     = "vpc-xyz789"
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group."
  default     = "dev-target-group"
}

variable "target_group_port" {
  type        = number
  description = "Port number for the target group."
  default     = 80
}

variable "target_group_protocol" {
  type        = string
  description = "Protocol used by the target group such as HTTP."
  default     = "HTTP"
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM cert for the HTTPS listener."
  default     = "arn:aws:acm:us-east-1:123456789012:certificate/example-certificate-arn"
}
