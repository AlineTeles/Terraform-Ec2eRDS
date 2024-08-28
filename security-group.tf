#security group da instancia EC2
resource "aws_security_group" "security-group" {
  vpc_id = aws_vpc.vpc-main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "main-sg"
  }
}

#security group do RDS
resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.vpc-main.id

  ingress {
    from_port       = 3306 # Porta padrão para MySQL
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.security-group.id] # Permite acesso apenas a partir do Security Group da EC2
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}