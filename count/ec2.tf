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

resource "aws_instance" "expense" {
  count = length(var.instas)
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all4.id]
  

  # tags = {
  #   Name = var.instas[count.index]
  # }
  tags = merge(
    var.common_tags,
    {
      Name = var.instas[count.index]
    }
  )
}
 output "insta_prip" {
  value = aws_instance.expense[*].private_ip
   
 }
