resource "aws_alb" "ecs-load-balancer" {
  name                = "ecs-load-balancer"
  security_groups     = ["${aws_security_group.sg.id}"]
  subnets             =  "${var.subnets}"

  tags {
    Name = "ecs-load-balancer"
  }
}

resource "aws_alb_target_group" "ecs-target-group" {
  name                = "ecs-target-group"
  port                = "80"
  protocol            = "HTTP"
  vpc_id              = "${var.vpc}"

  tags {
    Name = "ecs-target-group"
  }
}

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
    type             = "forward"
  }
}
