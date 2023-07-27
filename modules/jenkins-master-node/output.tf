output "jenkins-master-node-public-ip" {
  value = aws_instance.jenkins-master-node.public_ip
}
