output "vpc_id" {
    value = aws_vpc.expense-1.id
  
}
output "az_info" {
    value = data.aws_availability_zones.expense-1
  
}
output "default_vpc_info"{
    value = data.aws_vpc.default
} 