resource "azurerm_resource_group" "az-aks-rg" {
  name = var.resource_group_name
  location = var.location
}


resource "azurerm_kubernetes_cluster" "az-k8s-cluster" {
  name                = var.aks_cluster_name
  resource_group_name = azurerm_resource_group.az-aks-rg.name
  location            = azurerm_resource_group.az-aks-rg.location
  dns_prefix          = var.dns_prefix_name

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.node_size_name
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Terraform"
  }
}

resource "azurerm_network_security_group" "az-aks-nsg" {
  name                = var.nsg_name
  resource_group_name = azurerm_resource_group.az-aks-rg.name
  location            = azurerm_resource_group.az-aks-rg.location


  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
