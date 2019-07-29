resource "aws_instance" "jenkins" {
  ami = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name = "jenkins-key"
  subnet_id = "subnet-0ee339928e76a168f"
  security_groups = ["${aws_security_group.jenkins-sg.id}"]

  connection {
    user = "ec2-user"
    private_key = "${file("~/keys/jenkins-key.pem")}"
    agent = false
  }

  provisioner "file" {
    source = "${file("~/Projects/itea-devops/capstone/jenkins/nginx.conf")}"
    destination = "/nginx.conf"
  }

  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

sudo yum install -y jenkins git java-1.8.0 docker nginx
sudo yum remove java-1.7.0-openjdk

sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven

sudo cp -f /etc/nginx/nginx.conf /nginx.conf

sudo service docker start
sudo service jenkins start
sudo service nginx restart
EOF

  tags = {
    Name = "EC2Jenkins"
  }
}
