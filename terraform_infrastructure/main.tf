provider "aws"{
    region = "eu-west-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

module "vpc" {
    source = "./vpc"

    nat_gate_id = module.subnets.nat_gate_id
}

module "subnets" {
    source = "./subnets"
    vpc_id = module.vpc.vpc_id
    route_id = module.vpc.route_id
    route_id_private = module.vpc.route_id_private
    sec_group_id    = module.vpc.sec_group_id
    security_id = module.vpc.security_id
    internet_gate = module.vpc.internet_gate
    net_private_ips = ["10.0.1.50"]

}

module "ec2" {
    source          = "./ec2"

    net_id_prod          = module.subnets.net_id_prod
    net_id_test          = module.subnets.net_id_test
    net_id_jenkins          = module.subnets.net_id_jenkins
    net_id_bastion          = module.subnets.net_id_bastion
    ami_id          = "ami-08bac620dc84221eb"
    instance_type   = "t2.small"
    av_zone         = "eu-west-1a"
    key_name        = "firstkey"
    subnet_group_name = module.subnets.subnet_group_name
    sec_group_id_sql  = module.vpc.sec_group_id_sql
    subnet_id = module.subnets.subnet_id
    sec_group_id = module.vpc.sec_group_id
    MYSQL_ROOT_PASSWORD= var.MYSQL_ROOT_PASSWORD
    NAT_GATEWAY = module.subnets.nat_gate_ip
    SECRET_KEY = var.SECRET_KEY
    user_data =   <<-EOF
                          #!/bin/bash
                          sudo apt update -y
                          sudo apt install software-properties-common
                          sudo apt-add-repository --yes --update ppa:ansible/ansible
                          sudo apt install ansible -y
                          sudo apt install python3-flask -y
                        
                          #!/bin/bash
                          mysql --host=${module.subnets.nat_gate_ip}:3306 --user=admin --password=password testdb <<EOF
                        
                          CREATE DATABASE testdb;
                          CREATE DATABASE users;
                          USE users;
                          
                          DROP TABLE IF EXISTS users;
                          
                          CREATE TABLE users (
                            userName varchar(30) NOT NULL
                          );
                          
                          INSERT INTO users VALUES ('Bob'),('Jay'),('Matt'),('Ferg'),('Mo');

                        EOF>>
                     EOF
    
    
}