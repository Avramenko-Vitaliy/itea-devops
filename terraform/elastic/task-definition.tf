data "aws_ecs_task_definition" "nginx" {
  task_definition = "${aws_ecs_task_definition.nginx.family}"
}

resource "aws_ecs_task_definition" "nginx" {
  family = "nginx"

  container_definitions = <<EOF
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
    "image": "nginx:latest",
    "essential": true,
    "name": "nginx",
    "logConfiguration": {
      "logDriver": "fluentd",
        "options": {
          "tag": "/ecs-demo/nginx",
          "fluentd-address": "fluentd:24224"
        }
      }
  }
]
EOF
}

data "aws_ecs_task_definition" "fluentd" {
  task_definition = "${aws_ecs_task_definition.fluentd.family}"
}

resource "aws_ecs_task_definition" "fluentd" {
  family = "fluentd"

  container_definitions = <<EOF
[
  {
    "portMappings": [
      {
        "hostPort": 24224,
        "protocol": "tcp",
        "containerPort": 24224
      },
      {
        "hostPort": 24224,
        "protocol": "udp",
        "containerPort": 24224
      }
    ],
    "cpu": 256,
    "memory": 300,
    "image": "fluentd:latest",
    "essential": true,
    "name": "fluentd"
  }
]
EOF
}
