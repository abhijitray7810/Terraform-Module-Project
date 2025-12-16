variable "vpc_cidr" {
description = "CIDR block for VPC"
type = string
}


variable "vpc_name" {
description = "VPC name"
type = string
}


variable "subnets" {
description = "Subnet configuration"
type = map(object({
cidr_block = string
az = string
public = optional(bool, false)
}))
}
