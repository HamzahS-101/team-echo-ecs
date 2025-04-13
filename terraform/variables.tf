# VPC 

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the entire VPC (e.g., 10.0.0.0/16)."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for the public subnets in each Availability Zone."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for the private subnets in each Availability Zone."
}

variable "azs" {
  type        = list(string)
  description = "List of AWS Availability Zones to distribute resources across."
}

variable "aws_region" {
  type        = string
  description = "The AWS region where resources will be created."
}



# ALB

variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer."
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group attached to the ALB."
}

variable "target_group_port" {
  type        = number
  description = "Port the target group listens on."
}

variable "target_group_protocol" {
  type        = string
  description = "Protocol for the target group (e.g., HTTP or HTTPS)."
}

variable "alb_security_group_name" {
  type        = string
  description = "Name of the security group for the ALB."
}

variable "ecs_tasks_sg_name" {
  type        = string
  description = "Name of the security group for ECS tasks."
}

variable "ecs_tasks_sg_description" {
  type        = string
  description = "Description of the ECS tasks security group."
}

variable "ecs_tasks_ingress_port" {
  type        = number
  description = "Port on which ECS tasks accept traffic from the ALB."
}


# ECS

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster."
}

variable "task_definition_family" {
  type        = string
  description = "Family name for ECS task definition."
}

variable "task_cpu" {
  type        = number
  description = "CPU units for the ECS task."
}

variable "task_memory" {
  type        = number
  description = "Memory (in MB) for the ECS task."
}

variable "container_name" {
  type        = string
  description = "Name of the ECS container."
}

variable "container_cpu" {
  type        = number
  description = "CPU units for the ECS container."
}

variable "container_memory" {
  type        = number
  description = "Memory (in MB) for the ECS container."
}

variable "container_port" {
  type        = number
  description = "Port on which the container listens."
}

variable "docker_image" {
  type        = string
  description = "Docker image for the ECS container (ECR Repository URI)."
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service."
}

variable "desired_count" {
  type        = number
  description = "Desired number of ECS task replicas."
}

#Route 53

variable "hosted_zone_domain" {
  type        = string
  description = "Domain name of the Route 53 hosted zone (e.g., example.com)."
}

variable "domain_name" {
  type        = string
  description = "The full domain for the ACM certificate (e.g., app.example.com)."
}

variable "record_name" {
  type        = string
  description = "Subdomain or full record name to point to the ALB (e.g., app.example.com)."
}
