provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

resource "aws_instance" "db" {
  ami = "ami-00d8a762cb0c50254"
  instance_type = "t2.micro"

  tags ={
    Name = "DBServer"
  }

}
resource "aws_instance" "web" {
  ami = "ami-00d8a762cb0c50254"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]
  user_data = file("server-script.sh")

  tags ={
    Name = "WebServer"
  }

}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}

variable "ingress" {
  type = list(number)
  default = [ 80,443 ]
}
variable "egress" {
  type = list(number)
  default = [ 80,443 ]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow Web Traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content{
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.ingress
    content{
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}
output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}