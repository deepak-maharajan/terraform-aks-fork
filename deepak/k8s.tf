# create random name for resources
resource "random_pet" "prefix" {}

# create a resource group
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}
# CREATE AZURE CONTAINER REGISTRY

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.sku_type
  admin_enabled       = true

}


# CREATE KUBERENTES CLUSTER
resource "azurerm_kubernetes_cluster" "aks" {
  depends_on = [
    azurerm_container_registry.acr
  ]
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.vm_size
  }
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "CBA-pod"
    created_by  = "Deepak-terraform"
  }
}
resource "azurerm_role_assignment" "role_assign" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true

}


