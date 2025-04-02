locals {
  resource_name = "${var.project_name}-${var.Environmet}"
  az_names = slice(data.aws_availability_zones.expense-1.names, 0, 2)
}