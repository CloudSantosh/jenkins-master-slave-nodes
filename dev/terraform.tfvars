region                = "us-east-2"
project_name          = "Jenkins-master-slave-setup"
vpc_cidr              = "192.168.0.0/16"
public_subnet_az_cidr = "192.168.0.0/24"
instance_type         = "t2.medium"
keypair_algorithm     = "RSA"
keypair_name          = "project-keypair"
rsa_bit               = 4096
