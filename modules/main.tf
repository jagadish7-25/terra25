module "ec2-demo" {
    source = "git::https://github.com/jagadish7-25/terra25/tree/main/modules/ec2-instance"
    instance_type = "t2.micro"
  
}