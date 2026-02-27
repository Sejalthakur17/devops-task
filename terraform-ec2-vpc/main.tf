module "vpc" {
  source = "./modules/vpc"

  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
}

module "security_groups" {
  source = "./modules/security_groups"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  environment        = var.environment
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  public_subnet_id   = module.vpc.public_subnet_id
  security_group_id  = module.security_groups.ec2_sg_id
}