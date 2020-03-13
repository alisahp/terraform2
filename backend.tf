terraform {
  backend "s3" {
    bucket = "terraform-us-virgin"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}