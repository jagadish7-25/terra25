output "public_ip" {
    value = aws_instance.devops-terra.public_ip
    sensitive = false
  
}