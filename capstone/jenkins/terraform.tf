terraform {
  backend "s3" {
    bucket = "itea-devops-vitaliy-avramenko-1"
    key = "terraform/jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
