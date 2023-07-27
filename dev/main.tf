#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# create VPC
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module "vpc" {
  source                = "../modules/vpc"
  region                = var.region
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_az_cidr = var.public_subnet_az_cidr
}

module "security" {
  source       = "../modules/security"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id

}

module "keypair" {
  source            = "../modules/keypair"
  keypair_algorithm = var.keypair_algorithm
  rsa_bit           = var.rsa_bit
  keypair_name      = var.keypair_name
}


module "jenkins-server" {
  source                           = "../modules/jenkins-server"
  instance_type                    = var.instance_type
  keypair_name                     = var.keypair_name
  public_subnet_az_id              = module.vpc.public_subnet_az_id
  project_name                     = var.project_name
  jenkins_server_security_group_id = module.security.jenkins_server_security_group_id
}
/*
module "sonarqube-server" {
  source                             = "../modules/sonarqube-server"
  instance_type                      = var.instance_type
  keypair_name                       = var.keypair_name
  public_subnet_az_id                = module.vpc.public_subnet_az_id
  project_name                       = var.project_name
  sonarqube_server_security_group_id = module.security.sonarqube_server_security_group_id
}
*/
module "docker-server" {
  source                          = "../modules/docker-server"
  instance_type                   = var.instance_type
  keypair_name                    = var.keypair_name
  public_subnet_az_id             = module.vpc.public_subnet_az_id
  project_name                    = var.project_name
  docker_server_security_group_id = module.security.docker_server_security_group_id
}

