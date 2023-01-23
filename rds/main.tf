provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

resource "aws_db_instance" "myRDS" {
  name = "myDB"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.3.34"
  username = "bob"
  password = "password123"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}