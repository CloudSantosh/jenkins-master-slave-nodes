output "jenkins-master-node-public-ip" {
  value = module.jenkins-master-node.jenkins-master-node-public-ip

}

output "jenkins-slave-node-public-ip" {
  value = module.jenkins-slave-node.jenkins-slave-node-public-ip
}
