module "vpc_module" {
  source = "./modules/vpc"
}

module "alb_module" {
  source = "./modules/alb"
}


# module "route53" {
#   source = "../team-echo-ecs/terraform/modules/route53"

#   domain_name   = "test-example.com"
#   create_zone   = true
#   force_destroy = true
#   zone_comment  = "Zone for Route 53 module test"

#   records = [
#     # Test A record for a subdomain
#     {
#       name    = "test"
#       type    = "A"
#       ttl     = 300
#       records = ["1.2.3.4"]
#     },

#     # Optional: CNAME record
#     {
#       name    = "app"
#       type    = "CNAME"
#       ttl     = 300
#       records = ["example.com"]
#     }

#     # Optional: Root domain A record
#     # {
#     #   name    = ""
#     #   type    = "A"
#     #   ttl     = 300
#     #   records = ["1.2.3.5"]
#     # }
#   ]

#   tags = {
#     Env        = "sandbox"
#     CreatedBy  = "TerraformTest"
#   }
# }

module "ecs_module" {
  source = "./modules/ecs"
}