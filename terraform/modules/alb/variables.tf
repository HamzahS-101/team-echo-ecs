variable "alb_name" {
  type        = string
  description = "Name for the Application Load Balancer."
}

variable "alb_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for placing the ALB."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the ALB and security groups will be created."
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group associated with the ALB."
}

variable "target_group_port" {
  type        = number
  description = "Port number the target group will listen on."
}

variable "target_group_protocol" {
  type        = string
  description = "Protocol used by the target group (e.g., HTTP or HTTPS)."
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for HTTPS listener."
}

variable "alb_security_group_name" {
  type        = string
  description = "Name for the ALB security group."
}

variable "ecs_tasks_sg_name" {
  type        = string
  description = "Name for the ECS tasks security group."
}

variable "ecs_tasks_sg_description" {
  type        = string
  description = "Description for the ECS tasks security group."
}

variable "ecs_tasks_ingress_port" {
  type        = number
  description = "Port on which ECS tasks should accept incoming traffic from the ALB."
}


