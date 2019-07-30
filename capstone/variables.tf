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

variable "availability_zone" {
  default = {
    us-east-1 = "us-east-1a"
  }
}

variable "ecr_name" {
  default = "simple-back"
}

variable "ami_id" {
  default = "ami-fad25980"
}

########################### VPC Config ################################

variable "vpc" {
  default = "10.0.0.0/16"
}

variable "network_cidr" {
  default = "10.0.0.0/16"
}

variable "public_01_cidr" {
  default = "10.0.0.0/24"
}

variable "public_02_cidr" {
  default = "10.0.10.0/24"
}

########################### Autoscale Config ################################

variable "max_instance_size" {
  default = 2
}

variable "min_instance_size" {
  default = 2
}

variable "desired_capacity" {
  default = 2
}
