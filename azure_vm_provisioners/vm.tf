resource "azurerm_resource_group" "resouce_group" {
  name     = "dl-vm"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-terraform"
  resource_group_name = azurerm_resource_group.resouce_group.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

resource "azurerm_network_interface" "network_interface" {
  name                = "network-interface-terraform"
  location            = var.location
  resource_group_name = azurerm_resource_group.resouce_group.name

  ip_configuration {
    name                          = "public-ip-terraform"
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  tags = local.common_tags
}

resource "azurerm_network_interface_security_group_association" "network_interface_sga" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.secutity_group_id
}

resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  name                = "virtual-machine"
  resource_group_name = azurerm_resource_group.resouce_group.name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "terraform"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  admin_ssh_key {
    username   = "terraform"
    public_key = file("./azure-key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-lts"
    version   = "latest"
  }

  # Blocos para Provisioners
  provisioner "local-exec" {
    command = "echo ${self.public_ip_address} >> public_ip.txt"
  }

  connection {
    type        = "ssh"
    user        = "terraform"
    private_key = file("./azure-key")
    host        = self.public_ip_address
  }

  # Provisioner remote-exec: executa comandos remotos na máquina alvo
  provisioner "remote-exec" {
    inline = [
      "echo subnet_id: ${data.terraform_remote_state.vnet.outputs.subnet_id} >> /temp/network_info.txt",
      "echo network_security_group_ip: ${data.terraform_remote_state.vnet.outputs.secutity_group_id} >> /temp/network_info.txt"
    ]
  }

  provisioner "file" {
    source      = "./docs/"
    destination = "/tmp"
  }

  provisioner "file" {
    content     = "Vm size: ${self.size}"
    destination = "/tmp/vm_size.txt"
  }

  tags = local.common_tags
}