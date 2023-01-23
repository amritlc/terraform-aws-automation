provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

resource "aws_vpc" "chellenge1vpc" {
  cidr_block = "192.168.0.0/24"

  tags = {
    "Name" = "TerraformVPC"
  }
}

