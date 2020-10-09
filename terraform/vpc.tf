module "example_sg" {
    source = "./security_group"
    name = "module-sg"
    vpc_id = aws_vpc.example.id
    port = 80
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_vpc" "example" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        name = "example"
    }
}

resource "aws_subnet" "public_01" {
    vpc_id = aws_vpc.example.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "public_02" {
    vpc_id = aws_vpc.example.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-northeast-1c"
}

resource "aws_internet_gateway" "example" {
    vpc_id = aws_vpc.example.id
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.example.id
}

resource "aws_route_table_association" "public_01"{
    subnet_id = aws_subnet.public_01.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_02"{
    subnet_id = aws_subnet.public_02.id
    route_table_id = aws_route_table.public.id
}


resource "aws_subnet" "private_01" {
    vpc_id = aws_vpc.example.id
    cidr_block = "10.0.65.0/24"
    availability_zone = "ap-northeast-1a"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "private_02" {
    vpc_id = aws_vpc.example.id
    cidr_block = "10.0.66.0/24"
    availability_zone = "ap-northeast-1a"
    map_public_ip_on_launch = false
}

resource "aws_route_table" "private_01" {
    vpc_id = aws_vpc.example.id
}

resource "aws_route_table" "private_02" {
    vpc_id = aws_vpc.example.id
}


resource "aws_route_table_association" "private_01" {
    subnet_id = aws_subnet.private_01.id
    route_table_id = aws_route_table.private_01.id
}

resource "aws_route_table_association" "private_02" {
    subnet_id = aws_subnet.private_02.id
    route_table_id = aws_route_table.private_02.id
}

resource "aws_eip" "nat_gateway_01" {
    vpc = true
    depends_on = [aws_internet_gateway.example]
}

resource "aws_eip" "nat_gateway_02" {
    vpc = true
    depends_on = [aws_internet_gateway.example]
}

resource "aws_nat_gateway" "nat_gateway_01" {
    allocation_id = aws_eip.nat_gateway_01.id
    subnet_id = aws_subnet.public_01.id
    depends_on = [aws_internet_gateway.example]
}

resource "aws_nat_gateway" "nat_gateway_02" {
    allocation_id = aws_eip.nat_gateway_02.id
    subnet_id = aws_subnet.public_02.id
    depends_on = [aws_internet_gateway.example]
}

resource "aws_route" "private_01" {
    route_table_id = aws_route_table.private_01.id
    nat_gateway_id = aws_nat_gateway.nat_gateway_01.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "private_02" {
    route_table_id = aws_route_table.private_02.id
    nat_gateway_id = aws_nat_gateway.nat_gateway_02.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_security_group" "example" {
    name = "example"
    vpc_id = aws_vpc.example.id
}

resource "aws_security_group_rule" "ingress_example" {
    type = "ingress"
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.example.id
}

resource "aws_security_group_rule" "egress_example" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.example.id
}