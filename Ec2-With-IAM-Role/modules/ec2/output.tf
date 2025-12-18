output "public_ip" {
       value = aws_instance.main.public_ip
       description = "The public IP address of the EC2 instance"
}
output "instance_id" {
       value = aws_instance.main.id
       description = "The ID of the EC2 instance"
}
