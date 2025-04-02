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
  tags = merge (
    var.common_tags,
    var.public_subnet_tags,
    
    {
    Name = "${local.resource_name}-public-${local.az_names[count.index]}"
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