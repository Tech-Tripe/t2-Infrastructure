terraform {
  backend "s3" {
    bucket = "techtribe6bucketcloud1"
    key    = "techtribe6/prodution/terraform.tfstate"
    region = "us-west-1"
  }
}