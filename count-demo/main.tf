provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

resource "aws_instance" "ec2" {
  ami = "ami-09b2a1e33ce552e68"
  instance_type = "t2.micro"

  count = 2
}

