resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

# Define uma instância EC2
resource "aws_instance" "vm" {
  ami                         = "ami-0e86e20dae9224db8"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  # Provisioner local-exec: executa comandos localmente na máquina onde o Terraform está sendo executado
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }
  # Configura a conexão via SSH com a instância
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./aws-key")
    host     = self.public_ip  
  }

  # Provisioner remote-exec: executa comandos remotos na máquina alvo
  provisioner "remote-exec" {
    inline = [
      "echo subnet_id: ${data.terraform_remote_state.vpc.outputs.subnet_id} >> /tmp/network_info.txt",
      "echo security_group_ip: ${data.terraform_remote_state.vpc.outputs.security_group_id} >> /tmp/network_info.txt"
    ]
  }

  # Provisioner file: copia arquivos para a máquina alvo
  provisioner "file" {
    source      = "./teste.txt"
    destination = "/tmp/exemplo.txt"
  }

  # Provisioner file: copia arquivos para a máquina alvo
  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/ami.txt"
  }

  tags = {
    Name = "vm-terraform"
  }
}