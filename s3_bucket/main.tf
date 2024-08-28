resource "random_string" "random" {
  length  = "6"
  special = false
  upper   = false
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.bucket}${random_string.random.result}"
}