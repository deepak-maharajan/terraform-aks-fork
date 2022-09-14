
# resource group location --- required
variable "resource_group_location" {
  default     = "centralindia"
  description = "Location of the resource group."
}

# resource group name -- required
variable "resource_group_name" {
  default = "dm-aks-tf-rg"

}
# ********AKS VARIABLE********* AKS VARIABLE*****AKS VARIABLE***************
# vm count 
variable "agent_count" {
  default = 1
}

variable "vm_size" {
  default = "Standard_D2_v2"
}

# required for service principal
# The following two variable declarations are placeholder references.
# Set the values for these variable in terraform.tfvars
variable "aks_service_principal_app_id" {
  default = ""
}

variable "aks_service_principal_client_secret" {
  default = ""
}

# cluster name --- required
variable "cluster_name" {
  default = "deepak-cba-k8s"
}

# dns name --- required
variable "dns_prefix" {
  default = "deepak-dns"
}

# optional 
# Refer to https://azure.microsoft.com/global-infrastructure/services/?products=monitor for available Log Analytics regions.
variable "log_analytics_workspace_location" {
  default = "eastus"
}

# optional
variable "log_analytics_workspace_name" {
  default = "deepakLogAnalyticsWorkspaceName"
}

# for ssh 
variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

# ******ACR VARIABLE**********ACR VARIABLE**********ACR VARIABLE*************
variable "acr_name" {
  default = "deepakcbaacr01"
  type    = string

}

variable "sku_type" {
  default = "Standard"
}