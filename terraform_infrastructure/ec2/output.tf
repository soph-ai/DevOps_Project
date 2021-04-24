output "server_private_ip" {
  value = aws_instance.prod-instance.private_ip
}
output "server_public_ip" {
  value = aws_instance.prod-instance.public_ip
}
output "server_id" {
  value = aws_instance.prod-instance.id
}


output "jenks_private_ip" {
  value = aws_instance.jenkins-instance.private_ip
}
output "jenks_public_ip" {
  value = aws_instance.jenkins-instance.public_ip
}
output "jenks_id" {
  value = aws_instance.jenkins-instance.id
}

output "test_private_ip" {
  value = aws_instance.test-instance.private_ip
}
output "test_public_ip" {
  value = aws_instance.test-instance.public_ip
}
output "test_id" {
  value = aws_instance.test-instance.id
}


output "bastion_private_ip" {
  value = aws_instance.bastion-instance.private_ip
}
output "bastion_public_ip" {
  value = aws_instance.bastion-instance.public_ip
}
output "bastion_id" {
  value = aws_instance.bastion-instance.id
}