variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "this is the default ami id that we use for our terraform project "
  
}
variable "inst_type" {
    type = map 
    default = {
      mysql = "t2.micro"
      backend = "t2.micro"
      frontend = "t2.micro"
    }
}


# variable "tags" {
#     type = map 
#     default = {
#         Name ="Backend"
#         Project = "Expense"
#         Component = "Backend"
#         Environmet = "Dev" 
#     }
  
# }

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
