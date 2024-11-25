terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "basic_security" {
  # Allow all inbound traffic
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # Open to all sources
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # Open to all destinations
  }
}

resource "aws_instance" "redis-1" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  key_name      = "newkey"

  provisioner "remote-exec" {
    script = "redis_sentinel_setup.sh"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("terraform_ec2_key")
    host        = self.public_ip
  }

  vpc_security_group_ids = [aws_security_group.basic_security.id]
}

resource "aws_instance" "redis-2" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  key_name      = "newkey"

  provisioner "file" {
    source      = "sentinel.conf"
    destination = "/tmp/sentinel.conf"
  }

  provisioner "remote-exec" {
    script = "redis_sentinel_setup.sh"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("terraform_ec2_key")
    host        = self.public_ip
  }

  vpc_security_group_ids = [aws_security_group.basic_security.id]
}

resource "aws_instance" "redis-3" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  key_name      = "newkey"

  provisioner "file" {
    source      = "sentinel.conf"
    destination = "/tmp/sentinel.conf"
  }

  provisioner "remote-exec" {
    script = "redis_sentinel_setup.sh"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("terraform_ec2_key")
    host        = self.public_ip
  }

  vpc_security_group_ids = [aws_security_group.basic_security.id]
}

resource "aws_instance" "redis-4" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  key_name      = "newkey"

  provisioner "file" {
    source      = "sentinel.conf"
    destination = "/tmp/sentinel.conf"
  }

  provisioner "remote-exec" {
    script = "redis_sentinel_setup.sh"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("terraform_ec2_key")
    host        = self.public_ip
  }

  vpc_security_group_ids = [aws_security_group.basic_security.id]
}

resource "aws_key_pair" "deployer" {
  key_name   = "newkey"
  public_key = file("terraform_ec2_key.pub")
}
