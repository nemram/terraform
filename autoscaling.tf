resource "aws_launch_configuration" "example" {
  image_id        = "ami-09b90e09742640522"
  instance_type   = "t2.micro"
  security_groups = ["sg-02243f3ca4f64e813"]
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = ["subnet-04b4b374c303cdf37", "subnet-089aed60978d1677d"]
  
    provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "systemctl start httpd",
      "systemctl enamble httpd",
      "echo '<h1>Hello World</h1>' | sudo tee /var/www/html/index.html"
    ]
  }
}


