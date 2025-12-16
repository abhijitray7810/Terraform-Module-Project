## 🔹 root-main.tf

provider "aws" {
region = "us-east-1"
}


module "vpc" {
source = "./modules/vpc"
vpc_cidr = "10.0.0.0/16"
vpc_name = "my-vpc"


subnets = {
public-subnet-1 = {
cidr_block = "10.0.1.0/24"
az = "us-east-1a"
public = true
}


private-subnet-1 = {
cidr_block = "10.0.2.0/24"
az = "us-east-1b"
}
}
}
