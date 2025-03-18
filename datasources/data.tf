data "aws_ami" "today" {
  most_recent = true

  owners = ["992382427676"]
 
}

output "today_ami" {
    value = data.aws_ami.today.id
  
}

