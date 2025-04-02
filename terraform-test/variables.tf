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