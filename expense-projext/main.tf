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
resource "aws_subnet" "expense-1" {
  vpc_id     = aws_vpc.expense-1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = ""
  }
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