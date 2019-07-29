resource "aws_ecs_cluster" "capstone-cluster" {
  name = "${var.ecs_cluster}"
}
