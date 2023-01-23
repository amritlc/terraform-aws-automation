provider "aws" {
  region = "us-west-1"
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "amrit"
}

# STRING
variable "vpcname" {
  type = string
  default = "myvpc"
}

# NUMBER
variable "sshport" {
  type = number
  default = 22

}

# BOOOLEAN
variable "enabled" {
  default = false
}

# LIST
variable "mylist" {
  type = list(string)
  default = ["Value1","Value2"]
}

# TUPLE
variable "mymap" {
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value1"
  }
}

# TUPLE
variable "mytuple" {
  type = tuple([string,number,string])
  default = [
  "apple",1,"cat"]
}

# OBJECTS
variable "myobject" {
  type = object({name = string, port=list[number]})
  default = {
    name = "TJ"
    port = [22,25,80]
  }
}

# INPUT TYPE
variable "inputname" {
  type = string
  description = "Set the name of VPC"
}

# VARIABLES IMPLEMENTATION

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname
  }

#   tags = {
#     Name = var.vpcname
#   }
#   tags = {
#     Name = var.mylist[1]
#   }
#   tags = {
#     Name = var.mymap["Key1"]
#   }

}

# OUTPUT

output "vpcid" {
  value = aws_vpc.myvpc.id
}

