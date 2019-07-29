resource "aws_instance" "jenkins" {
  ami = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name = "jenkins-key"
  subnet_id = "subnet-0ee339928e76a168f"
  security_groups = ["${aws_security_group.jenkins-sg.id}"]

  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

sudo yum install -y jenkins git java-1.8.0-devel docker

sudo wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven

sudo /usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
sudo /usr/sbin/alternatives --set javac /usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin/javac

sudo usermod -a -G docker ec2-user

sudo service docker start
sudo service jenkins start
EOF

  tags = {
    Name = "EC2Jenkins"
  }
}
