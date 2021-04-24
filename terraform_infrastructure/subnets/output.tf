output "net_id_prod"{
    value = aws_network_interface.web-server-nic.id
}

output "net_id_test"{
    value = aws_network_interface.test-nic.id
}

output "net_id_jenkins"{
    value = aws_network_interface.jenkins-nic.id
}

output "net_id_bastion"{
    value = aws_network_interface.bastion-nic.id
}

output "nat_gate_id" {
  value = aws_nat_gateway.gw.id
}

output "subnet_group_name" {
    value = aws_db_subnet_group.private-group.name
  
}

output "server_public_ip" {
    value = aws_eip.one.public_ip
}

output "subnet_id" {
    value = aws_subnet.subnet-1.id
  
}

output "nat_gate_ip"{
    value = aws_eip.one.public_ip
}