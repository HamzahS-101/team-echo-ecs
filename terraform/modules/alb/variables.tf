variable "alb_name" {
  type        = string
  description = "Name of the ALB."
}

variable "alb_security_group_name" {
  type        = string
  description = "Name of the security group for the ALB."
}

variable "target_security_group_name" {
  type        = string
  description = "Name of the SG for the TG."
}

variable "alb_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the ALB."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC for the TG."
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group."
}

variable "target_group_port" {
  type        = number
  description = "Port number for the target group."
}

variable "target_group_protocol" {
  type        = string
  description = "Protocol used by the target group such as HTTP."
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM cert for the HTTPS listener."
}
