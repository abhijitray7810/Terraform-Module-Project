output "ec2_public_ip" {
       value = module.ec2_instance.public_ip
       description = "The public IP address of the EC2 instance"
}
