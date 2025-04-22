variable "azure_subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "azure_client_id" {
  description = "The Azure client ID"
  type        = string
}

variable "azure_client_secret" {
  description = "The Azure client secret"
  type        = string
}

variable "azure_tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}

variable "location" {
  description = "Location/Zone where the resources will be created"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Default Resource Group name"
  type        = string
  default     = "tf-aks-bms-rg"
}

variable "aks_cluster_name" {
  description = "Default AKS cluster name"
  type        = string
  default     = "tf-bms-aks"
}

variable "dns_prefix_name" {
  description = "Default DNS prefix name"
  type        = string
  default     = "tf-bms-aks-dns"
}

variable "node_size_name" {
  description = "Default Node size name"
  type        = string
  default     = "Standard_D4ds_v5"
}

variable "nsg_name" {
  description = "Default NSG name"
  type        = string
  default     = "tf-aks-nsg"
}