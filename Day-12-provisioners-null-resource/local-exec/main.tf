provider "aws" {
  region = "us-east-1"
}

# -----------------------------
# RDS MySQL
# -----------------------------
resource "aws_db_instance" "mysql_rds" {
  identifier          = "gani-mysql-db"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20

  db_name             = "dev"
  username            = "admin"
  password            = "Password123!"
  publicly_accessible = true

  skip_final_snapshot = true
}

# -----------------------------
# Run SQL using null_resource
# -----------------------------
resource "null_resource" "run_sql" {

  depends_on = [aws_db_instance.mysql_rds]

  provisioner "local-exec" {
    command = "mysql -h ${aws_db_instance.mysql_rds.address} -u admin -pPassword123! dev < init.sql"
  }

  triggers = {
    always_run = timestamp()
  }
}
