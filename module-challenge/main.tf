provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

module "db" {
  source = "./db"
  
}
module "web" {
  source = "./web"
  
}

output "module_private_ip" {
  value = module.db.PrivateIP
}
output "module_public_ip" {
  value = module.web.pub_ip
}