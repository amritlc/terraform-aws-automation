provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

resource "aws_instance" "ec2" {
  ami = "ami-09b2a1e33ce552e68"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]

  tags ={
    Name = "HelloAmrit"
  }

}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    
  }
}