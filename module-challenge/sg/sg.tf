variable "ingress" {
  type = list(number)
  default = [ 80,443 ]
}
variable "egress" {
  type = list(number)
  default = [ 80,443 ]
}

output "sg_name" {
  value = aws_security_group.webtraffic.name
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