variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "this is the default ami id that we use for our terraform project "
  
}
variable "inst_type" {
    type = string
    default = "t2.nano"
    description = "this is the free source instance we used for terraform"
  
}


variable "tags" {
    type = map 
    default = {
        Name ="Backend"
        Project = "Expense"
        Component = "Backend"
        Environmet = "Dev" 
    }
  
}

variable "sg_name" {
    default= "allow_all4"

# }
# variable "from_port" {
#   default = "22"
# }
# variable "to_port" {
#   default = "22"
# }
# variable "ing_cidr" {
#   type = list(string)
#   default = ["0.0.0.0/0"]
 }
variable "ingress_rules" {
  default = [
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    },
    {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}