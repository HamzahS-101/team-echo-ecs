output "alb_dns_name" {
  value       = aws_lb.alb.dns_name
  description = "DNS name of the Application Load Balancer."
}

output "alb_arn" {
  value       = aws_lb.alb.arn
  description = "ARN of the Application Load Balancer."
}

output "alb_zone_id" {
  value       = aws_lb.alb.zone_id
  description = "The AWS-managed hosted zone ID associated with the ALB, required for creating Route 53 alias records."
}


output "target_group_arn" {
  value       = aws_lb_target_group.target_group.arn
  description = "ARN of the ALB target group."
}

output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "ID of the ALB security group."
}

output "ecs_tasks_sg_id" {
  value       = aws_security_group.ecs_tasks.id
  description = "ID of the ECS tasks security group (used by ECS and referenced by VPC endpoints)."
}

