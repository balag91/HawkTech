provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-12345678"
  instance_type = "t2.medium"
  tags = {
    Name = "DashAppServer"
  }
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}