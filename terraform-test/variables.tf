variable "project_name" {
    default = "expense-1"
  
}
variable "Environmet" {
    default = "dev"
  
}
variable "common_tags" {
    default = {
        project = "expense-1"
        terraform = "true"
        Environmet = "dev"
    }
  
}
variable "public_subnet_cidrs" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
  
}