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

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.resource_name_prefix}-gw"
  }
}

resource "aws_subnet" "subnet" {
  count = length(data.aws_availability_zones.az_list.names)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.${count.index}.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[count.index]


  tags = {
    Name = "${var.resource_name_prefix}-subnet-${count.index}"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.resource_name_prefix}-rt"
  }
}

resource "aws_route_table_association" "rta" {
  count = length(aws_subnet.subnet)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}