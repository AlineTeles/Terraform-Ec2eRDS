Bom, este projeto tem como objetivo colocar em prática um curso de terraform que fiz.
É o meu primeiro projeto então com certeza ainda tem muito a ser melhorado, aceito sugestões.


**PROJETO:** Construí uma infraestrutura que suporta uma aplicação web escalável e segura. A infraestrutura inclui um servidor de aplicação e banco de dados.


**COMPONENTES DA INFRAESTRUTURA:**

**VPC:** Criei uma Virtual Private Cloud (VPC) personalizada, com sub-redes públicas e privadas, para segmentar e isolar os recursos.

**EC2:** Lancei uma instância EC2 na sub-rede pública para hospedar mUM site, com uma configuração automática para instalar e configurar um servidor web.

**RDS:** Configurei uma instância RDS (MySQL) na sub-rede privada para armazenar os dados da aplicação, garantindo que o banco de dados não esteja acessível diretamente pela internet.

**NAT Gateway:** Implementei um NAT Gateway para permitir que recursos nas sub-redes privadas possam acessar a internet, mantendo a segurança e o isolamento.

**Segurança:** Utilizei Security Groups para controlar o tráfego de rede, permitindo apenas conexões seguras entre os recursos.

Recursos Úteis:
- **Documentação do Terraform**: [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
