resource "azurerm_virtual_network" "blockvnet" {
    for_each =var.vnet101
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  subnet {
    name             = each.value.subnet_name
    address_prefixes = each.value.address_prefixes
  }

}