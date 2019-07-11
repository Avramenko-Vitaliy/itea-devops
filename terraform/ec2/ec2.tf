resource "aws_key_pair" "deployer" {
  key_name   = "itea-test-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCl1fwTk4wrgYvB0f1bNuE8wYuAPMswUk8gi+rlhlV0eZvq2TrqZ2XlX0CKZusj0LUlhpkr/hjgKsrQhPdHF9D80sNqzGPask8oXRBYJL/zwfdAntrMJShyyawEKzEez4J0lHi5dwaf8tEujZ5ZfT+OzTwUy/9cUUbY+ctWH8sVz7OLIk6RhL6oSXl/8QIGxqwxG/ZlgU+2w93Cdw6wX/LLXvpaD01SH5H4jU0eeSvK17hDg38rBmijssFp1HdGbgi9RHttnk7qYmfdU0nTVJhml75GkfR66rbJ5KEcml7+GEmNBxRNllGxfa+sDhOc/X/t77ieI6jamfjk0eBlYIPB vitaliy.avramenko@ardas.biz"
}

resource "aws_instance" "web" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.instance_profile.name}"
  key_name = "${aws_key_pair.deployer.key_name}"
  subnet_id = "subnet-0ee339928e76a168f"
  security_groups = ["${aws_security_group.sg.id}"]
  user_data = <<EOF
#!/bin/bash
sudo yum update
sudo yum install -y nginx
sudo /etc/init.d/nginx start
EOF

  tags = {
    Name = "EC2Nginx"
  }
}
