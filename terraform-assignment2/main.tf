#root module main.tf


module "rgroup" {
  source = "./modules/rgroup"
}

module "network" {
  source = "./modules/network"

  resource_group_name = "n01498358-assignment1-RG"
  #subnet_name         = module.network.subnet_name

  tags = var.tags
  depends_on = [module.rgroup]
}

module "common" {
  source = "./modules/common"

  resource_group_name = "n01498358-assignment1-RG"
  location            = "eastus"
  tags                = var.tags
  depends_on = [module.rgroup]
}




module "linux" {
  source   = "./modules/linux"
  vm_count = 2
  vm_size  = "Standard_B1s"
  ssh_user = "centos"
  #ssh_private_key_path = "~/.ssh/id_rsa"

  subnet_id   = module.network.subnet_id
  vnet_name   = module.network.vnet_name
  subnet_name = module.network.subnet_name
  #vnet_name = "8358vnet"
  storage_account_uri = module.common.storage_account_uri
  depends_on = [module.rgroup]
}


module "vm_windows" {
  source                          = "./modules/vmwindows"
  resource_group_name             = "n01498358-assignment1-RG"
  location                        = "eastus"
  subnet_id                       = module.network.subnet_id
  vm_name                         = "vm-windows"
  vm_size                         = "Standard_B1s"
  admin_username                  = "adminuser"
  admin_password                  = "Sahil@123"
  os_disk_name                    = "osdisk-windows"
  os_type                         = "Windows"
  dns_label                       = "public-ipwindows"
  avail_set_name                  = "8358windows-avail-set"
  public_ip_dns_label             = "win8358publicip"
  antimalware_extension_name      = "IaaSAntimalware"
  antimalware_extension_publisher = "Microsoft.Azure.Security"
  antimalware_extension_type      = "IaaSAntimalware"
  antimalware_extension_version   = "1.3"
  boot_diagnostics_storage_uri    = module.common.storage_account_uri
  depends_on = [module.rgroup]

}



module "datadisk" {
  source              = "./modules/datadisk"
  location            = "eastus"
  resource_group_name = "n01498358-assignment1-RG"
  subnet_id           = module.network.subnet_id
  vm_count            = 3
  tags                = var.tags
  linux_vm_ids        = module.linux.vm_ids
  vmwindows_vm_id     = module.vm_windows.vm_id
  depends_on = [module.rgroup]
}








module "loadbalancer" {
  source              = "./modules/loadbalancer"
   resource_group_name = "n01498358-assignment1-RG"
  location            = "eastus"
linux_vm_ids = module.linux.vm_ids
depends_on = [module.rgroup]

}



module "database" {
  source              = "./modules/database"
  prefix              = "n8358"
  location            = "eastus"
  resource_group_name = "n01498358-assignment1-RG"
  db_name             = "mydatabase"
  db_admin_username   = "adminuser"
  db_admin_password   = "Sahil@123"
  depends_on = [module.rgroup]
}
