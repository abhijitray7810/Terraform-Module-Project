provider "aws" {
       region = var.aws_region
}

module "vpc" {
       source = "./modules/vpc"
       vpc_cidr = var.vpc_cidr
       subnet_cidr = var.subnet_cidr
}
module "iam_role" {
       source = "./modules/iam"
}
module "ec2_instance" {
       source = "./modules/ec2"
       subnet_id = module.vpc.subnet_id
       vpc_id = module.vpc.vpc_id
       instance_profile = module.iam_role.instance_profile
       key_name = var.key_name

}
