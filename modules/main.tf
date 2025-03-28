module "ec2-demo" {
    source = "./modules/ec2-instance"
    instance_type = "t2.micro"
  
}