# environments/dev/main.tf
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr_block    = var.vpc_cidr_block
  public_subnet_cidrs = var.public_subnet_cidrs
}
module "security_group" {
  source = "../../modules/security-group"

  name        = "Allow HTTP"
  vpc_id      = module.vpc.vpc_id
  description = "Allow inbound HTTP traffic"

  ingress_rules = [{
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

module "ec2" {
  source = "../../modules/ec2"

  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.security_group.security_group_id]
}

module "s3" {
  source = "../../modules/s3"

  bucket_name = var.bucket_name
  
}