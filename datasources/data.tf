data "aws_ami" "today" {
  most_recent = true
  owners = ["992382427676"] 
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  
 
 
}

output "today_ami" {
    value = data.aws_ami.today.id
  
}

