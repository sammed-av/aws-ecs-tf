resource "aws_ecs_cluster" "django_cluster" {
  name = "django-cluster"
}

resource "aws_lb" "django_alb" {
  name               = "django-alb"
  internal           = false
  load_balancer_type = "application"
  subnets           = var.public_subnets
}

resource "aws_lb_target_group" "django_tg" {
  name     = "django-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"
}

resource "aws_ecs_service" "django_service" {
  name            = "django-service"
  cluster         = aws_ecs_cluster.django_cluster.id
  task_definition = aws_ecs_task_definition.django_task.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets = var.private_subnets
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.django_tg.arn
    container_name   = "django-container"
    container_port   = 8000
  }
}
