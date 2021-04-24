output "production_ip" {
    value = module.ec2.server_public_ip
}
output "test_ip" {
    value = module.ec2.test_public_ip
}
output "jenk_ip" {
    value = module.ec2.jenks_public_ip
}

output "bastion_ip" {
    value = module.ec2.bastion_public_ip
}