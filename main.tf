locals {
  project       = "devops-test"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_key_pair" "key" {
  key_name      = "${local.project}-key"
  public_key    = file(var.key_path)
}

module "network" {
  source                = "./modules/network"

  project               = local.project

  aws_region            = var.aws_region
  availability_zones    = lookup(var.availability_zones, var.aws_region)

  vpc_cidr              = "10.0.0.0/16"
  public_subnets_cidr   = ["10.0.1.0/24"]
}
