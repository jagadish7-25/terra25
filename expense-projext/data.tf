data "aws_availability_zones" "expense-1"{
    state = "available"
}
data "aws_vpc" "default"{
    default = "true"
}