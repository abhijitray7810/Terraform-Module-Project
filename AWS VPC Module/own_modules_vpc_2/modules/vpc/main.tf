resource "aws_vpc" "this" {
cidr_block = var.vpc_cidr


tags = {
Name = var.vpc_name
}
}


# Internet Gateway (created only if public subnet exists)
resource "aws_internet_gateway" "this" {
count = length([for s in var.subnets : s if s.public]) > 0 ? 1 : 0
vpc_id = aws_vpc.this.id


tags = {
Name = "${var.vpc_name}-igw"
}
}


# Subnets
resource "aws_subnet" "this" {
for_each = var.subnets


vpc_id = aws_vpc.this.id
cidr_block = each.value.cidr_block
availability_zone = each.value.az


map_public_ip_on_launch = each.value.public


tags = {
Name = each.key
Type = each.value.public ? "public" : "private"
}
}


# Public Route Table
resource "aws_route_table" "public" {
count = length(aws_internet_gateway.this) > 0 ? 1 : 0
vpc_id = aws_vpc.this.id


route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.this[0].id
}


tags = {
Name = "${var.vpc_name}-public-rt"
}
}


# Associate public subnets with route table
resource "aws_route_table_association" "public" {
for_each = {
for k, v in aws_subnet.this : k => v if var.subnets[k].public
}


subnet_id = each.value.id
route_table_id = aws_route_table.public[0].id
}
