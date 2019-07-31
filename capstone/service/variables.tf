# main creds for AWS connection
variable "aws_access_key_id" {
}

variable "aws_secret_access_key" {
}

variable "ecs_cluster" {
  default = "capstone-itea"
}

variable "ecs_key_pair_name" {
  default = "itea-devops-l-config"
}

variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-fad25980"
}

variable "ecs_service_role" {
  default = "ecs-service-role"
}

variable "ecr_back_name" {
  default = "130114285352.dkr.ecr.us-east-1.amazonaws.com/simple-back"
}

variable "ecr_back_tag" {}

variable "ecr_nginx_name" {
  default = "130114285352.dkr.ecr.us-east-1.amazonaws.com/nginx"
}

variable "ecr_nginx_tag" {
  default = "latest"
}
