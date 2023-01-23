provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

resource "aws_instance" "db" {
  ami = "ami-09b2a1e33ce552e68"
  instance_type = "t2.micro"

  tags ={
    Name = "DB"
  }

}
resource "aws_instance" "web" {
  ami = "ami-09b2a1e33ce552e68"
  instance_type = "t2.micro"

  depends_on = [
    aws_instance.db
  ]

  tags ={
    Name = "WEB"
  }

}

# DATA SOURCES

data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = ["DB"]
  }
}

output "dbservice" {
  value = data.aws_instance.dbsearch.availability_zone
}

