module "rgmodule" {
  source = "../azurerm_child_module/azurerm_resource_group"
  rg101  = var.rg201
}



module "storagemodule" {
  source       = "../azurerm_child_module/azurerm_storage_account"
  depends_on   = [module.rgmodule]
  storage101   = var.storage201
  container101 = var.container201
  blob101      = var.blob201

}

module "vnetmodule" {
  source = "../azurerm_child_module/azurerm_vnet"
  depends_on = [module.rgmodule ]
  vnet101 = var.vnet201

}

module "nicmodule" {
  source = "../azurerm_child_module/azurerm_nic"
  depends_on = [ module.vnetmodule ]
  nic101 = var.nic201
  
}














# # Virtual Network
# resource "azurerm_virtual_network" "vnet" {
#   name                = "linux-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# # Subnet
# resource "azurerm_subnet" "subnet" {
#   name                 = "linux-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# # Public IP
# resource "azurerm_public_ip" "public_ip" {
#   name                = "linux-vm-public-ip"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   allocation_method   = "Static"
# }

# # Network Security Group
# resource "azurerm_network_security_group" "nsg" {
#   name                = "linux-nsg"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   security_rule {
#     name                       = "SSH"
#     priority                   = 1001
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "10.0.1.0/24"
#     destination_address_prefix = "*"
#   }
# }

# # NIC
# resource "azurerm_network_interface" "nic" {
#   name                = "linux-vm-nic"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.public_ip.id
#   }
# }

# # Associate NSG with NIC
# resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
#   network_interface_id      = azurerm_network_interface.nic.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }

# # Linux Virtual Machine
# resource "azurerm_linux_virtual_machine" "vm" {
#   name                = "linux-vm"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   size                = "Standard_B1s"
#   admin_username      = data.azurerm_key_vault_secret.vmuser.value
#   # admin_password      = data.azurerm_key_vault_secret.vmpass.value
#   disable_password_authentication = "false"
#   allow_extension_operations      = "false"
#   network_interface_ids = [
#     azurerm_network_interface.nic.id,
#   ]
#   admin_ssh_key {
#     username   = "noida32"
#     public_key = data.azurerm_key_vault_secret.ssh_pub_key.value
#   }
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"

#   }




#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }


# data "azurerm_key_vault" "keyref" {
#   name                = "nagendra"
#   resource_group_name = "linux-vm-rg"
# }



# data "azurerm_key_vault_secret" "vmuser" {
#   name         = "vmusername"
#   key_vault_id = data.azurerm_key_vault.keyref.id
# }


# # data "azurerm_key_vault_secret" "vmpass" {
# #   name         = "vmpassword"
# #   key_vault_id = data.azurerm_key_vault.keyref.id
# # }


# data "azurerm_key_vault_secret" "ssh_pub_key" {
#   name         = "sshvmpublickey"
#   key_vault_id = data.azurerm_key_vault.keyref.id
# }