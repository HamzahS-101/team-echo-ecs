terraform {
  backend "s3" {
    bucket       = "team-echo-ecs"
    key          = "terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
  }
}