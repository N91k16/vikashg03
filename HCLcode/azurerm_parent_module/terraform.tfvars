rg201 = {
  rgprod = {
    name     = "tcsrg"
    location = "West US"
  }
}


storage201 = {
  storageprod = {
    storage_account_name     = "stgkey"
    location                 = "west us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    resource_group_name      = "tcsrg"
  }

}


container201 = {
  containerprod = {
    name                  = "tcscontainer"
    # storage_account_id    = "/subscriptions/289da116-5358-4835-8897-9e1db2cde3d2/resourceGroups/tcsrg/providers/Microsoft.Storage/storageAccounts/stgkey"
    container_access_type = "blob"
  }
}



blob201 = {
  blobprod = {
    name                   = "tcsblob"
    storage_account_name   = "stgkey"
    storage_container_name = "tcscontainer"
    type                   = "Block"
  }
}

vnet201 = {
  vnetprod = {
  name                = "tcsvnet"
  location            = "west US"
  resource_group_name =  "tcsrg"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
   subnet_name             = "tcssubnet"
    address_prefixes = ["10.0.1.0/24"]
  

  }
}

nic201 = {
  nicprod= {
  name = "tcsnic"
  location = "west us"
  resource_group_name = "tcsrg"
  ip_name = "tcsip"
  private_ip_address_allocation = "Dynamic"
  }
}
