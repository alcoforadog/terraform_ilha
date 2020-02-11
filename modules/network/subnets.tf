#Public route
resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    count                   = length(var.public_subnets_cidr)
    cidr_block              = element(var.public_subnets_cidr, count.index)
    availability_zone       = element(var.availability_zones, count.index)
    map_public_ip_on_launch = true

    tags = {
        Name        = "${var.project}-public-subnet-${element(var.availability_zones, count.index)}"
    }
}
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name        = "${var.project}-public-route-table"
    }
}
resource "aws_route_table_association" "public" {
    count          = length(var.public_subnets_cidr)
    subnet_id      = element(aws_subnet.public.*.id, count.index)
    route_table_id = aws_route_table.public.id
}