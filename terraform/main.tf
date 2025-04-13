module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  aws_region           = var.aws_region
  ecs_task_sg_id       = module.alb.ecs_tasks_sg_id
}


module "alb" {
  source = "./modules/alb"

  alb_name                 = var.alb_name
  alb_subnet_ids           = module.vpc.public_subnet_ids
  vpc_id                   = module.vpc.vpc_id
  target_group_name        = var.target_group_name
  target_group_port        = var.target_group_port
  target_group_protocol    = var.target_group_protocol
  acm_certificate_arn      = module.route53.acm_certificate_arn
  alb_security_group_name  = var.alb_security_group_name
  ecs_tasks_sg_name        = var.ecs_tasks_sg_name
  ecs_tasks_sg_description = var.ecs_tasks_sg_description
  ecs_tasks_ingress_port   = var.ecs_tasks_ingress_port
}

module "ecs" {
  source = "./modules/ecs"

  cluster_name           = var.cluster_name
  task_definition_family = var.task_definition_family
  task_cpu               = var.task_cpu
  task_memory            = var.task_memory
  container_name         = var.container_name
  container_cpu          = var.container_cpu
  container_memory       = var.container_memory
  container_port         = var.container_port
  docker_image           = var.docker_image
  service_name           = var.service_name
  desired_count          = var.desired_count
  private_subnet_ids     = module.vpc.private_subnet_ids
  ecs_tasks_sg_id        = module.alb.ecs_tasks_sg_id
  target_group_arn       = module.alb.target_group_arn


}


module "route53" {
  source = "./modules/route53"

  hosted_zone_domain = var.hosted_zone_domain
  domain_name        = var.domain_name
  record_name        = var.record_name

  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id

}
