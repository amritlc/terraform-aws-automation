resource "aws_instance" "db" {
  ami = "ami-00d8a762cb0c50254"
  instance_type = "t2.micro"

  tags ={
    Name = "DB Server"
  }

}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}

