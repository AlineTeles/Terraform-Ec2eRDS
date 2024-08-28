
resource "aws_instance" "web_server" {
  ami             = "ami-0862be96e41dcbf74" #ubunto
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet_1.id            # Sub-rede pública
  security_groups = [aws_security_group.security-group.name] # Security Group com regras para HTTP/HTTPS

  tags = {
    Name = "web-server"
  }
  # script instala e inicia um servidor Apache
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF
}

resource "aws_key_pair" "key" {
  key_name   = "aws-${var.enviroment}"
  public_key = file("./aws-key.pub")
}
#esse bloco não cria as chaves, apenas sobe para a aws a chave pública
#logo, é necessário criar um par de chaves 
#neste caso, criei um par de chaves utilizando o terminal
#comando: ssh-keygen -f aws-key
#utilizando a função file(localdoarquivo), para ler as chaves
