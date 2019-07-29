variable "profile_name" { default = "glomex" }

variable "ecs_key_pair_name" { default = "itea-devops-l-config" }

variable "ami_id" { default = "ami-007571470797b8ffa" }

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" { default = "us-east-1" }

variable "ecs_cluster" { default = "itea-dovops-homework" }

variable "max_instance_size" { default = 2 }

variable "min_instance_size" { default = 2 }

variable "desired_capacity" { default = 2 }

variable "subnets" { default = ["subnet-0ee339928e76a168f", "subnet-02f8ebad92fc4a032", "subnet-0c885d5ca86b19d34"] }

variable "vpc" { default = "vpc-037e10ab9aea2fe35" }
