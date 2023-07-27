output "jenkins-server-public-ip" {
  value = module.jenkins-server.jenkins-server-public-ip

}
/*
output "sonarqube-server-public-ip" {
  value = module.sonarqube-server.sonarqube-server-public-ip

}
*/
output "docker-server-public-ip" {
  value = module.docker-server.docker-server-public-ip

}
