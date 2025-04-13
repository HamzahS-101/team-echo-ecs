variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster."
}

variable "task_definition_family" {
  type        = string
  description = "Family name for the ECS task definition."
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
  description = "Name of the container in the task definition."
}

variable "container_cpu" {
  type        = number
  description = "CPU units assigned to the container."
}

variable "container_memory" {
  type        = number
  description = "Memory (in MB) assigned to the container."
}

variable "container_port" {
  type        = number
  description = "Port on which the container listens."
}

variable "docker_image" {
  type        = string
  description = "Docker image used for the container (ECR Repository URI)."
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service."
}

variable "desired_count" {
  type        = number
  description = "Desired number of running ECS task instances."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for ECS networking."
}

variable "ecs_tasks_sg_id" {
  type        = string
  description = "Security group ID for ECS tasks (injected from ALB module)."
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the ALB target group for service load balancing."
}

