module "vpc_module" {
  source = "./modules/vpc"
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