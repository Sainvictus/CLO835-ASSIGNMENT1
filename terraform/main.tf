provider "aws" {
  region = var.aws_region
}

# ECR Repositories
resource "aws_ecr_repository" "webapp" {
  name         = "webapp"
  force_delete = true
}

resource "aws_ecr_repository" "mysql" {
  name         = "mysql"
  force_delete = true
}

# Security Group
resource "aws_security_group" "ec2_security_group" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8081
    to_port     = 8083
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

# EC2 Instance
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  # Use the existing LabInstanceProfile
  iam_instance_profile = "LabInstanceProfile"

  key_name = "vockey"

  tags = {
    Name = "CLO835-Assignment1"
  }
}