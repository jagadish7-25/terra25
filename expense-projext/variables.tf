variable "vpc_cidr" {
    default = "10.0.0.0/16"
  
}
variable "common_tags" {
    default = {
      
    }
  
}
variable "Environmet" {
    type = string
  
}
variable "project_name" {
  type = string
}
variable "vpc_tags" {
    default = {}
  
}
variable "igw_tags" {
    default ={}
  
}