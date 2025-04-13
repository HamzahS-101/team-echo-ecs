output "cluster_id" {
  value       = aws_ecs_cluster.cluster.id
  description = "ID of the ECS cluster."
}

output "task_definition_arn" {
  value       = aws_ecs_task_definition.task_definition.arn
  description = "ARN of the ECS task definition."
}

output "service_name" {
  value       = aws_ecs_service.service.name
  description = "Name of the ECS service."
}

