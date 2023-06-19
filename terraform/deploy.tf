/*====
Variables utilizadas en todos los módulos
======*/

locals {
  availability_zones = var.availability_zones
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "public_key" {
  content  = tls_private_key.key.public_key_openssh
  filename = "tf_rsa.pub"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "prod_key"
  public_key = local_file.public_key.content
}

module "networking" {
  source               = "./modules/networking"
  environment          = var.environment
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24"]
  region               = var.region
  availability_zones   = local.availability_zones
  key_name             = "prod_key"
}

module "ecs" {
  source              = "./modules/ecs"
  environment         = var.environment
  region              = var.region
  ecs_cpu             = "256" // 256 vCPU's
  ecs_memory          = "512" // 512 MB's
  vpc_id              = module.networking.vpc_id
  availability_zones  = local.availability_zones
  repository_name     = "ror_app"
  subnets_ids         = module.networking.private_subnets_id
  public_subnet_ids   = module.networking.public_subnets_id
  security_groups_ids = module.networking.security_groups_ids
  secret_key_base     = var.secret_key_base
  volume = {
    volume_id = module.volume.volume_id
  }
}

module "volume" {
  source               = "./modules/volume"
  name                 = "ror_app_volume"
  availability_zone    = local.availability_zones[0]
  size                 = 30
}
