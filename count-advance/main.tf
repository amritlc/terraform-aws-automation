provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

module "db" {
  source = "./db"
  server_names = ["mariadb","mysql","mssql"]
}

output "private_ip" {
  value = module.db.PrivateIP
}