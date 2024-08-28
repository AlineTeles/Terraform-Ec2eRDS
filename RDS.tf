
resource "aws_db_instance" "app_db" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  #name                 = "appdb"  # Nome do banco de dados
  username               = "admin" # Usuário do banco
  password               = "senhadb"
  parameter_group_name   = "default.mysql8.0"
  publicly_accessible    = false # Garantir que não seja acessível pela internet
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot    = true

  tags = {
    Name = "app-db"
  }
}

#Define as sub-redes privadas onde o RDS pode ser criado
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id]

  tags = {
    Name = "RDS subnet group"
  }
}