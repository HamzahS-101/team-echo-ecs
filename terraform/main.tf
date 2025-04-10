module "vpc_module" {
  source = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  azs                 = ["eu-west-2a", "eu-west-2b"]
  public_subnet_cidrs = ["10.0.0.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.1.0/24", "10.0.3.0/24"]
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