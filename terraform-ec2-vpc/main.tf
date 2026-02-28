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
  subnet_id          = module.vpc.private_subnet_id
  security_group_id  = module.security_groups.ec2_sg_id
}

resource "aws_instance" "bastion" {
  ami                         = "ami-0a6193f0120f4fd88"  
  instance_type               = "t3.micro"
  subnet_id                   = module.vpc.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.security_groups.bastion_sg_id]
  key_name                    = var.key_name

  tags = {
    Name = "sejal-${var.environment}-bastion"
  }
}