provider "aws" {
  region = "us-west-2"
}
# Gets Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
output "UBUNTU_AMI_ID" {
  value = "${data.aws_ami.ubuntu.id}"
}
# Gets Centos AMI
data "aws_ami" "centos" {
  most_recent = true
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["679593333241"] # Canonical
}
resource "aws_key_pair" "provisioner" {
  key_name   = "provisioner-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.provisioner.key_name}"
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
      host        = "${self.public_ip}"
    }
    inline = [
        "sudo apt-get install telnet -y",
        "sudo mkdir /tmp/ubuntu",
        "w",
        "free -m",
        "sleep 5"
        ]
  }
    tags = {
    Name = "HelloWorld"
    }
}
output "CENTOS_AMI_ID" {
  value = "${data.aws_ami.centos.id}"
}