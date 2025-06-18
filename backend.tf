terraform {
  backend "s3" {
    bucket = "techtribe6bucketcloud1"
    key    = "techtribe6/prodution/terraform.tfstate"
    region = "us-west-1"
  }
}

resource "aws_dynamodb_table" "file_locks" {
  name           = "FileLocks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "objectKey"

  attribute {
    name = "objectKey"
    type = "S"
  }
}
