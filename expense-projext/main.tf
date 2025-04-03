resource "aws_vpc" "expense-1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = merge (
    var.common_tags,
    var.vpc_tags,
    {
    Name = local.resource_name
    }
  )
}
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.expense-1.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = "true"
  tags = merge (
    var.common_tags,
    var.public_subnet_tags,
    
    {
    Name = "${local.resource_name}-public-${local.az_names[count.index]}"
    }
  )

  
}
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.expense-1.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge (
    var.common_tags,
    var.private_subnet_tags,
    
    {
    Name = "${local.resource_name}-private-${local.az_names[count.index]}"
    }
  )

  
}
resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.expense-1.id
  cidr_block = var.database_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge (
    var.common_tags,
    var.database_subnet_tags,
    
    {
    Name = "${local.resource_name}-database-${local.az_names[count.index]}"
    }
  )

  
}

resource "aws_db_subnet_group" "database-grp" {
  name = local.resource_name
  subnet_ids = aws_subnet.database[*].id
  tags = merge(
    var.common_tags,
    var.db_subnet_tags,
    {
      Name = local.resource_name
    }

  )
  
  
}


resource "aws_internet_gateway" "expense-1" {
  vpc_id = aws_vpc.expense-1.id
  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name = local.resource_name
    }
  )
  
}

resource "aws_eip" "nat" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "expense-1" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    var.nat_gateway_tags,
  {
    Name = local.resource_name
  }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.expense-1]
}


resource "aws_route_table" "public-r" {
  vpc_id = aws_vpc.expense-1.id

  

  tags = merge (
    var.common_tags,
    var.public_route_table_tags,
    {
    Name = "${local.resource_name}-public"
    }
  )
}
resource "aws_route_table" "private-r" {
  vpc_id = aws_vpc.expense-1.id

  

  tags = merge (
    var.common_tags,
    var.private_route_table_tags,
    {
    Name = "${local.resource_name}-private"
    }
  )
}
resource "aws_route_table" "database-r" {
  vpc_id = aws_vpc.expense-1.id

  

  tags = merge (
    var.common_tags,
    var.database_route_table_tags,
    {
    Name = "${local.resource_name}-database"
    }
  )
}
resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public-r.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.expense-1.id
}
resource "aws_route" "private_route_table_tags" {
  route_table_id            = aws_route_table.private-r.id
  destination_cidr_block    = "0.0.0.0/0"

  gateway_id = aws_nat_gateway.expense-1.id
}
resource "aws_route" "private_route_table_tags" {
  route_table_id            = aws_route_table.database-r.id
  destination_cidr_block    = "0.0.0.0/0"

  gateway_id = aws_nat_gateway.expense-1.id
}