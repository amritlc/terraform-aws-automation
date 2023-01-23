resource "aws_instance" "web" {
  ami = "ami-00d8a762cb0c50254"
  instance_type = "t2.micro"
  security_groups = [ module.sg.sg_name ]
  user_data = file("./web/server-script.sh")

  tags ={
    Name = "Web server"
  }

}

output "pub_ip" {
  value = module.eip.PublicIP
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.web.id
}

module "sg" {
  source = "../sg"

}

output "instance_id" {
  value = aws_instance.web.id
}


# variable "ec2dbname" {
#   type = string
# }
# variable "ec2webname" {
#   type = string
# }

