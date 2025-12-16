
## VPC Module


### Features
- Custom VPC CIDR
- Multiple subnets
- Public & Private subnet support
- Auto IGW creation
- Public route table association


### Input Example


```hcl
subnets = {
public-1 = {
cidr_block = "10.0.1.0/24"
az = "us-east-1a"
public = true
}
private-1 = {
cidr_block = "10.0.2.0/24"
az = "us-east-1b"
}
}
