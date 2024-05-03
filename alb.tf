resource "aws_alb" "example" {
  name            = "example-alb"
  security_groups = ["sg-02243f3ca4f64e813"]
  subnets         = ["subnet-04b4b374c303cdf37", "subnet-089aed60978d1677d"]
  internal        = false
}

resource "aws_alb_target_group" "example" {
  name     = "example-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-04eb998128ba3735a"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_alb_listener" "example" {
  load_balancer_arn = aws_alb.example.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.example.arn
  }
}

