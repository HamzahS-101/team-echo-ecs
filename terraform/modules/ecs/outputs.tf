output "ecs_cluster_id" {
  description = "ID of the ECS Cluster."
  value       = aws_ecs_cluster.cluster.id
}

output "ecs_service_id" {
  description = "ID of the ECS Service."
  value       = aws_ecs_service.service.id
}

output "task_execution_role_arn" {
  description = "ARN of the IAM role used for ECS task execution."
  value       = aws_iam_role.task_execution_role.arn
}

output "ecs_task_definition_arn" {
  description = "ARN of the ECS Task Definition."
  value       = aws_ecs_task_definition.task_definition.arn
}
