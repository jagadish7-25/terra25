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


  
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.ing_cidr
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "devops-terra" {
  ami           = var.ami_id
  instance_type = var.inst_type
  vpc_security_group_ids = [aws_security_group.allow_all4.id]
  

  tags = {
    Name = "var.tags"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > public_ip.txt"
  }

    connection {
    type        = "ssh"
    user        = "ec2-user"               # Change for Ubuntu (`ubuntu`)
    password = "DevOps321"
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo rm -rf /usr/share/nginx/index.html",
      "sudo copy terra25/provi/index.html /usr/share/nginx/index.html",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
  
}
