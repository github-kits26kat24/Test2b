
resource "aws_lb" "test3b_lb" {
  name               = "Test3B-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.testcase_sg.id]
  subnets            = [aws_subnet.Amazon_Linux_main.id, aws_subnet.ubuntu_main.id]

  enable_deletion_protection = false

  # access_logs {
  #   bucket  = aws_s3_bucket.project03.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_listener" "test3b_front_end" {
  load_balancer_arn = aws_lb.test3b_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test3b.arn
  }
}

resource "aws_lb_target_group" "test3b" {
  name     = "Test3B-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.testcase_main.id
}


