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

variable "ecs_task_sg_id" {
  type        = string
  description = "ID of the ECS tasks security group (used by ECS and referenced by VPC endpoints)."
}
