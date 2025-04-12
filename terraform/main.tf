module "vpc_module" {
  source = "./modules/vpc"
  ecs_task_sg_id       = var.ecs_task_sg_id
}

module "alb_module" {
  source = "./modules/alb"
}

module "route53_module" {
  source = "./modules/route53"
}

module "ecs_module" {
  source = "./modules/ecs"
}