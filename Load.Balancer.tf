# resource "aws_lb" "test" {
#   name               = "test-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.testcase_sg.id]
#   subnets            = [ aws_subnet.ubuntu_main.id , aws_subnet.redhat_main.id]

#   enable_deletion_protection = true

# #   access_logs {
# #     bucket  = aws_s3_bucket.lb_logs.id
# #     prefix  = "test-lb"
# #     enabled = true
# #   }

#   tags = {
#     Environment = "production"
#   }
# }

