data "aws_ecs_cluster" "ecs-cluster" {
    cluster_name = "${var.ecs_cluster}"
}
