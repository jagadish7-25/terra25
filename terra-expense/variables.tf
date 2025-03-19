variable "instance_names" {
    type = list
    default = [ "mysql","backend","frontend" ]
  
}
# variable "ami_id" {
#     type = string
#     default = "ami-09c813fb71547fc4f"
#     description = "this is the default ami id that we use for our terraform project "
  
# }
variable "common_tags" {
  type = map 
  default = {
    Project = "Expense"
    Environmet = "Dev"
    terraform = true
  }
  
}
variable "sg_name" {
    default= "allow_all4"

}
variable "from_port" {
  default = "22"
}
variable "to_port" {
  default = "22"
}
variable "ing_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
