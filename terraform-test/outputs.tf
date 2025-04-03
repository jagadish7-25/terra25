output "vpc" {
    value = module.vpc.vpc_id
  
}
output "az_info" {
    value = module.vpc.az_info
  
}
output "default_vpc_info" {
    value = module.vpc.default_vpc_info
  
}
output "default_route_table" {
    value = module.vpc.default_route_table
  
}