variable "ecs_key_pair_name" { default = "itea-devops-l-config" }

variable "ami_id" { default = "ami-007571470797b8ffa" }

variable "aws_access_key" { default = "AKIAR4S3KN4UP7BHW77F" }

variable "aws_secret_key" { default = "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" }

variable "aws_region" { default = "us-east-1" }

variable "ecs_cluster" { default = "itea-capstone" }

variable "max_instance_size" { default = 2 }

variable "min_instance_size" { default = 2 }

variable "desired_capacity" { default = 2 }

variable "ecr_name" { default = "simple-back"}

variable "availability_zones" { default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"] }

variable "vpc_cidr" { default = "10.0.0.0/16" }

variable "public_subnet_cidr" { default = "10.0.0.0/24" }
