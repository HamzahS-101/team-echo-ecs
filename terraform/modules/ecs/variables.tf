variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster."
  default     = "dev-cluster"
}

variable "iam_role_name" {
  type        = string
  description = "Name of the IAM role for ECS tasks."
  default     = "ecs-task-execution-role"
}

variable "iam_policy_name" {
  type        = string
  description = "Name of the IAM policy for ECS tasks."
  default     = "ecs-task-execution-policy"
}

variable "task_definition_family" {
  type        = string
  description = "Family name for the ECS task definition."
  default     = "dev-task-family"
}

variable "task_cpu" {
  type        = number
  description = "CPU units for the ECS task."
  default     = 256
}

variable "task_memory" {
  type        = number
  description = "Memory for the ECS task."
  default     = 512
}

variable "container_name" {
  type        = string
  description = "Name of the container in the ECS task definition."
  default     = "dev-container"
}

variable "docker_image" {
  type        = string
  description = "Docker image to use for the ECS container."
  default     = "nginx:latest"
}

variable "container_cpu" {
  type        = number
  description = "CPU units for the ECS container."
  default     = 256
}

variable "container_memory" {
  type        = number
  description = "Memory for the ECS container."
  default     = 512
}

variable "container_port" {
  type        = number
  description = "Port number the container listens on."
  default     = 80
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service."
  default     = "dev-service"
}

variable "desired_count" {
  type        = number
  description = "Desired number of tasks to run in the ECS service."
  default     = 1
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs where the ECS service will be deployed."
  default     = ["subnet-abc123", "subnet-def456"]
}

variable "container_security_group_id" {
  type        = string
  description = "ID of the security group attached to the ECS container."
  default     = "sg-container"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the target group associated with the ECS service."
  default     = "arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/dev-tg/abcdef123456"
}
