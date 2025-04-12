module "vpc_module" {
  source = "./modules/vpc"
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