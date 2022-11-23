resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "${var.resource_name_prefix}-vpc"
  }
}

data "aws_availability_zones" "az_list" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.resource_name_prefix}-igw"
  }
}

resource "aws_eip" "ngw_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "${var.resource_name_prefix}-ngw"
  }

  depends_on = [aws_internet_gateway.igw, aws_eip.ngw_eip]
}

resource "aws_subnet" "public_subnet" {
  count = length(data.aws_availability_zones.az_list.names)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.${count.index}.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.resource_name_prefix}-public-${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(data.aws_availability_zones.az_list.names)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.${count.index + length(resource.aws_subnet.public_subnet)}.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[count.index]

  map_public_ip_on_launch = false

  tags = {
    Name = "${var.resource_name_prefix}-private-${count.index}"
  }
}

resource "aws_route_table" "public_subnet_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.resource_name_prefix}-public-rt"
  }
}

resource "aws_route_table" "private_subnet_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "${var.resource_name_prefix}-private-rt"
  }
}

resource "aws_route_table_association" "public_rta" {
  count = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_subnet_rt.id
}

resource "aws_route_table_association" "private_rta" {
  count = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_subnet_rt.id
}