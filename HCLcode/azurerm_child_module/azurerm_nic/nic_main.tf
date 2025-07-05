resource "azurerm_network_interface" "nicblock" {
        for_each = var.nic101
  name                = each.value.name
  location            = each.value.location
   resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = data.azurerm_subnet.datasubnet.id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

data "azurerm_subnet" "datasubnet" {
  name                 = "tcssubnet"
  virtual_network_name = "tcsvnet"
  resource_group_name  = "tcsrg"
}