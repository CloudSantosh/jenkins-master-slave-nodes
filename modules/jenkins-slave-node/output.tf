output "jenkins-slave-node-public-ip" {
  value = aws_instance.jenkins-slave-node.public_ip
}
