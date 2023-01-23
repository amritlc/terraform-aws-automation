terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

variable "ingressrule" {
  type = list(number)
  default = [ 80, 443]
}
variable "egressrule" {
  type = list(number)
  default = [ 80, 443,25,3306,53,8080]
}

resource "aws_instance" "ec2" {
  ami = "ami-00874d747dde814fa"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]

  tags ={
    Name = "HelloAmrit"
  }

}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrule
    content {
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]  
    }
    
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egressrule
    content {
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]  
    }
    
  }

}

