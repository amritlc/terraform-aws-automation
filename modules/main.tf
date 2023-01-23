provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

module "ec2module" {
  source = "./ec2"
  ec2name = "Name from Module"
}

output "module_output" {
  value = module.ec2module.instance_id
}

