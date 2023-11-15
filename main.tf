resource "aws_s3_bucket" "example" {
  bucket = "rhoribe-test-bucket"

  tags = {
    Name        = "rhoribe-test-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "example1" {
  bucket = "rhoribe-test-bucket1"

  tags = {
    Name        = "rhoribe-test-bucket1"
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


# data "aws_ami" "this" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "architecture"
#     values = ["arm64"]
#   }
#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023*"]
#   }
# }


# resource "aws_instance" "this" {
#   ami = data.aws_ami.this.id
#   instance_market_options {
#     spot_options {
#       max_price = 0.0031
#     }
#   }
#   instance_type = "t4g.nano"
#   tags = {
#     Name = "test-spot"
#   }
# }