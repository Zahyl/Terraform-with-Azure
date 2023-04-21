# data "azurerm_resource_group" "existing" {
#   name = "n01498358-assignment1-RG"
# }
	
resource "azurerm_resource_group" "rgroup" {
  name     = "n01498358-assignment1-RG"
  location = "eastus"
  
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "sahil.solanki"
    Project        = "Automation Project – Assignment 1"
  }
}
