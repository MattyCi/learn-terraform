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

resource "aws_instance" "redis-1" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  key_name      = "newkey"
}

resource "aws_instance" "redis-2" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  key_name      = "newkey"
}

resource "aws_instance" "redis-3" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  key_name      = "newkey"
}

resource "aws_key_pair" "deployer" {
  key_name   = "newkey"
  public_key = file("terraform_ec2_key.pub")
}
