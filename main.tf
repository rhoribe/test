resource "aws_s3_bucket" "example" {
  bucket = "rhoribe-test-bucket"

  tags = {
    Name        = "rhoribe-test-bucket"
    Environment = "Dev"
  }
}



terraform {
  backend "s3" {
    bucket         = var.bucket
    key            = var.key
    region         = var.region
    encrypt        = true
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "c6a.2large"

  tags = {
    Name = "HelloWorld"
  }
}