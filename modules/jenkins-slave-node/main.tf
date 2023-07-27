
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   use data source to get all avalablility zones in region
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data "aws_availability_zones" "available_zones" {}

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  fetching AMI ID
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data "aws_ami" "ubuntu-linux-1404" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  creating ec2 instances in public subnet
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "jenkins-slave-node" {
  ami           = data.aws_ami.ubuntu-linux-1404.id
  instance_type = var.instance_type
  //count           = 1
  key_name        = var.keypair_name
  subnet_id       = var.public_subnet_az_id
  security_groups = [var.jenkins_slave_security_group_id]
  user_data       = data.template_file.user_data.rendered

  tags = {
    Name = "Worker1-${var.project_name}"
  }
}
