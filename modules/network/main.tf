# Internet VPC
resource "aws_vpc" "main" {
    cidr_block           = var.vpc_cidr
    enable_dns_support   = "true"
    enable_dns_hostnames = "true"
    enable_classiclink   = "false"
    tags = {
        Name        = "${var.project}-vpc"
    }
}

# Internet GW
resource "aws_internet_gateway" "main_igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name        = "${var.project}-igw"
    }
}

# Access internet to a public network
resource "aws_route" "public_internet_gateway" {
    route_table_id         = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.main_igw.id
}