resource "aws_db_instance" "django_db" {
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  name                 = "django_db"
  username             = "admin"
  password             = var.db_password
  publicly_accessible  = false
  skip_final_snapshot  = true
}

output "db_endpoint" { value = aws_db_instance.django_db.endpoint }
