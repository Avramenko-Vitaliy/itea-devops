resource "aws_ecs_service" "test-ecs-service" {
  name            = "test-ecs-service"
  iam_role        = "${aws_iam_role.ecs-service-role.name}"
  cluster         = "${aws_ecs_cluster.test-ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.nginx.family}:${data.aws_ecs_task_definition.nginx.revision}"
  desired_count   = 2
  depends_on      = [
    "aws_iam_role_policy_attachment.ecs-instance-role-attachment",
    "aws_alb.ecs-load-balancer"
  ]

  load_balancer {
    target_group_arn  = "${aws_alb_target_group.ecs-target-group.arn}"
    container_port    = 80
    container_name    = "nginx"
  }
}
