
terraform {
  # Bloco que configura opções específicas do Terraform, como o backend e a versão.

  # Exemplo: Neste bloco, você define configurações do Terraform, como a versão a ser usada e detalhes do backend, que é onde o estado do Terraform será armazenado.
}

provider "aws" {
  # Bloco que configura o provedor de infraestrutura, como AWS, Azure, ou Google Cloud.

  # Exemplo: Neste bloco, você especifica qual provedor vai usar (por exemplo, AWS) e suas credenciais para acessar a infraestrutura desse provedor.
}

resource "aws_instance" "vm1" {
  # Bloco que define um recurso de infraestrutura, como uma instância EC2 na AWS.

  # Exemplo: Neste bloco, você descreve o recurso que deseja criar, como uma máquina virtual na AWS, e atribui um nome para referenciá-la no seu projeto.
}

data "aws_ami" "image" {
  # Bloco usado para buscar informações externas que podem ser utilizadas dentro da configuração do Terraform.

  # Exemplo: Neste bloco, você busca uma imagem de máquina virtual existente na AWS para usar na configuração de uma nova instância.
}

module "estrutura_vpc" {
  # Bloco que agrupa configurações reutilizáveis em módulos, que podem ser locais ou remotos.

  # Exemplo: Neste bloco, você chama um módulo que configura uma VPC, reutilizando configurações padronizadas para simplificar a criação de infraestrutura complexa.
}

variable "vm_name" {
  # Bloco que define variáveis de entrada que podem parametrizar a configuração.

  # Exemplo: Neste bloco, você define uma variável que pode ser usada para especificar o nome de uma máquina virtual, permitindo flexibilidade na configuração.
}

output "vm1_ip" {
  # Bloco que exporta informações da configuração do Terraform para uso externo.

  # Exemplo: Neste bloco, você define um output que exporta o endereço IP de uma máquina virtual, permitindo que essa informação seja usada fora do Terraform, como em scripts ou documentação.
}

locals {
  # Bloco que define variáveis locais usadas para simplificar e evitar duplicação de código.

  # Exemplo: Neste bloco, você define uma variável local para armazenar uma expressão complexa ou repetida, facilitando a leitura e manutenção do código.
}