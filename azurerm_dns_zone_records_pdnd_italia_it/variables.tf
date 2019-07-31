# Generic variables

variable "environment" {
  description = "The nick name identifying the type of environment (i.e. test, staging, production)."
}

variable "location" {
  description = "The data center location where all resources will be put into."
}

variable "resource_name_prefix" {
  description = "The prefix used to name all resources created."
}

# DNS module specific variables

variable "dns_record_ttl" {
  description = "The DNS records TTL in seconds."
}

locals {
  azurerm_resource_group_name = "${var.resource_name_prefix}-${var.environment}"
}
