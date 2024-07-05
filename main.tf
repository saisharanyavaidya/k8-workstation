# Here we are creating instances for Jenkins using terraform.. we need to install few dependencies after creating instance using .sh fies in user-data, so instead of manual process we are using terraform

module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "workstation"

  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0fbcae1d2d339bcf4"]
  subnet_id = "subnet-0ce3cdb1524e357ae"
  ami = data.aws_ami.ami_id.id
  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 50
    }
  ]

  user_data = file("workstation.sh")
  
  tags = {
        name = "workstation"
  } 
}
