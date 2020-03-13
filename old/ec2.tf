resource "aws_instance" "web" {
  count       = 3
  ami           = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.deployer.key_name}"
}

resource "aws_instance" "web2" {
  ami          = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.deployer.key_name}"
  
}