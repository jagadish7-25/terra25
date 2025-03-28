module "ec2-demo" {
  source         = "./modules/ec2-instance"   # Change with a valid AMI ID
  instance_type  = "t2.micro"
  instance_name  = "MyTerraformInstance"
}
