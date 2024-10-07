module "vsphere_vms" {
  source = "../../"
  
  vsphere_server   = var.vsphere_server
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  
  vm_count         = var.vm_count
  vm_name_prefix   = var.vm_name_prefix
  vm_template      = var.vm_template
  vm_cpu           = var.vm_cpu
  vm_ram           = var.vm_ram
  vm_disk_size     = var.vm_disk_size
  vm_datastore     = var.vm_datastore
  vm_domain        = var.vm_domain
  vm_dns_name_prefix = var.vm_dns_name_prefix
  vm_ip_prefix     = var.vm_ip_prefix
  vm_network       = var.vm_network
  vm_vlan          = var.vm_vlan
  vm_dmz           = var.vm_dmz
  vm_encryption    = var.vm_encryption
  vm_cluster       = var.vm_cluster
  vm_host          = var.vm_host
}