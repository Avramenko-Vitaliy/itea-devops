terraform {
  backend "s3" {
    bucket = "itea-devops-vitaliy-avramenko-1"
    key = "terraform/service/terraform.tfstate"
    region = "us-east-1"
  }
}
