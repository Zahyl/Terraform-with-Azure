# modules/network/main.tf

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.resource_group_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "allow_ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

variable "resource_group_name" {
  default = "n01498358-assignment1-RG"
}

variable "location" {
  description = "Location of the resources."
  default = "eastus"
}

variable "subnet_name" {
  description = "Name of the subnet."
  default = "subnet1"
}

variable "tags" {
  type = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project = "Automation Project – Assignment 1"
    Name = "sahil.solanki"
    ExpirationDate = "2023-06-30"
    Environment = "Lab"
  }
}

variable "vnet_name" {
  default = "8358vnet"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "CIDR block for the subnet."
  default = "10.0.1.0/24"
}