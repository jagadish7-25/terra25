resource "aws_vpc" "expense-1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "expnse-1"
  }
}