resource "aws_ecr_repository" "simple-back-repo" {
  name = "${var.ecr_name}"
}

data "aws_ecr_repository" "simple-back-repo" {
  name = "${var.ecr_name}"
}
