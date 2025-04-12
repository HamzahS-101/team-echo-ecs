module "vpc_module" {
  source = "./modules/vpc"
  ecs_task_sg_id       = var.ecs_task_sg_id
}

module "alb_module" {
  source = "./modules/alb"
}


 module "route53" {
   source = ".modules/route53"
 }

module "ecs_module" {
  source = "./modules/ecs"
}