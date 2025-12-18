resource "aws_instance" "main" {
  ami           = "ami-0ebf411a80b6b22cb"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile = var.instance_profile

  tags = {
    Name = "ec2-iam-role"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}
