data "aws_ami" "today_ami" {
  most_recent = true
  owners = ["992382427676"] 
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
   filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  
 
 
}

output "today_ami" {
    value = data.aws_ami.today_ami.image_id
  
}

