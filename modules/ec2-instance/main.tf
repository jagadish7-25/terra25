
resource "aws_instance" "devops-terra" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-09c956a01686bdc1d"]
  

  tags = {
    Name = "instance-terra"
}
}
