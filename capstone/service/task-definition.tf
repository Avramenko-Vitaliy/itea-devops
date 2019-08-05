data "aws_ecs_task_definition" "capstone" {
  task_definition = "${aws_ecs_task_definition.capstone.family}"
}

resource "aws_ecs_task_definition" "capstone" {
    family = "capstone-app"
    container_definitions = <<DEFINITION
[
  {
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": 80
      }
    ],
    "cpu": 256,
    "memory": 300,
    "image": "${var.ecr_nginx_name}:${var.ecr_nginx_tag}",
    "essential": true,
    "name": "nginx",
    "links": ["simple-back"]
  },
  {
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": 8080
      }
    ],
    "cpu": 256,
    "memory": 300,
    "image": "${var.ecr_back_name}:${var.ecr_back_tag}",
    "essential": true,
    "name": "simple-back"
  }
]
DEFINITION

}
