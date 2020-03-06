resource "aws_instance" "web" {
  ami           = "ami-0a887e401f7654935"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}