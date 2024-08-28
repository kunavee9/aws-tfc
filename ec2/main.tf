data "azurerm_resource_group" "rg_name" {
  name = "Azuretst-2703"
}

resource "azurerm_storage_account" "example" {
  name                     = var.name  #"storageacc12tfbackend"
  resource_group_name      = data.azurerm_resource_group.rg_name.name
  location                 = data.azurerm_resource_group.rg_name.location
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type#"LRS"

  tags = {
    environment = "backend-tf"
  }
}

resource "azurerm_storage_container" "backendcontainer" {
    name                  = "tfbackendcontainer"
    storage_account_name  = azurerm_storage_account.example.name
    container_access_type = "private"
}


