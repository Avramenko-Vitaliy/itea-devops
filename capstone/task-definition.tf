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
    "image": "nginx:latest",
    "essential": true,
    "name": "nginx"
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
    "image": "130114285352.dkr.ecr.us-east-1.amazonaws.com/simple-back:26d47bd3ead231d99c615e4ca39028a611dfc466",
    "essential": true,
    "name": "simple-back"
  }
]
DEFINITION
}
