resource "aws_ecs_service" "ecs-service" {
  	name = "ecs-service"
  	iam_role =  "${var.ecs_service_role}"
  	cluster = "${data.aws_ecs_cluster.ecs-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.capstone.family}:${max("${aws_ecs_task_definition.capstone.revision}", "${data.aws_ecs_task_definition.capstone.revision}")}"
  	desired_count = 2
	deployment_minimum_healthy_percent = 100
	deployment_maximum_percent = 200

  	load_balancer {
    	target_group_arn = "${data.aws_alb_target_group.ecs-target-group.arn}"
    	container_port = 80
    	container_name = "nginx"
	}
}
