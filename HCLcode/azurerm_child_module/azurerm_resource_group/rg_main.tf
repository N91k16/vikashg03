resource "azurerm_resource_group" "blockrg" {
  for_each = var.rg101
  name     = each.value.name
  location = each.value.location
}
