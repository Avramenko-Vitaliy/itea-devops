resource "aws_autoscaling_group" "ecs-autoscaling-group" {
  name = "ecs-autoscaling-group"
  max_size = "${var.max_instance_size}"
  min_size = "${var.min_instance_size}"
  desired_capacity = "${var.desired_capacity}"
  vpc_zone_identifier = ["${aws_subnet.us-east-1-public-1.id}", "${aws_subnet.us-east-1-public-2.id}", "${aws_subnet.us-east-1-public-3.id}"]
  launch_configuration = "${aws_launch_configuration.ecs-launch-configuration.name}"
  health_check_type = "ELB"
  availability_zones = "${var.availability_zones}"
}
