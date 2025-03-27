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

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
    from_port        = ingress.value["from_port"]
    to_port          = ingress.value["to_port"]
    protocol         = ingress.value ["protocol"]
    cidr_blocks      = ingress.value.cidr_blocks
    }
  }
}

resource "aws_instance" "devops-terra" {
  ami           = var.ami_id
  instance_type = var.inst_type
  vpc_security_group_ids = [aws_security_group.allow_all4.id]
  

  tags = {
    Name = "var.tags"
  }
}
