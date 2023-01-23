terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "lc-remote-backend-2023"
    region = "us-west-1"
    access_key = ""
    secret_key = ""

  }
}