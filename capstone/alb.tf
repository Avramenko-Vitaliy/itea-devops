resource "aws_alb" "ecs-load-balancer" {
  name = "ecs-load-balancer"
  security_groups = ["${aws_security_group.sg.id}"]
  subnets =  ["${aws_subnet.us-east-1-public-1.id}", "${aws_subnet.us-east-1-public-2.id}", "${aws_subnet.us-east-1-public-3.id}"]

  tags {
    Name = "ecs-load-balancer"
  }
}

resource "aws_alb_target_group" "ecs-target-group" {
  name = "ecs-target-group"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${aws_vpc.capstone-vpc.id}"

  tags {
    Name = "ecs-target-group"
  }
}

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
    type = "forward"
  }
}
