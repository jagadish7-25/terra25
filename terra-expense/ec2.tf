resource "aws_instance" "expense" {
  count = length(var.instance_names)
  ami           = data.aws_ami.today_ami.image_id
  instance_type = var.instance_names[count.index] == "mysql" ? "t3.micro" : "t3micro"
  vpc_security_group_ids = [aws_security_group.allow_all4.id]
  

  # tags = {
  #   Name = var.instas[count.index]
  # }
  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )
}
resource "aws_security_group" "allow_all4" {
  name        = "allow_all4"
  description = "Allow TLS inbound traffic and all outbound traffic"
  

  tags = {
    Name = var.sg_name
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "tcp"
    cidr_blocks      = var.ing_cidr
    ipv6_cidr_blocks = ["::/0"]
  }
}
