provider "vsphere" {
  vsphere_server = var.vsphere_vcenter
  user           = var.vsphere_user
  password       = var.vsphere_password

  allow_unverified_ssl = var.vsphere_unverified_ssl
}
# folders
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}
resource "vsphere_folder" "root" {
  path          = var.vsphere_folder_env
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}
resource "vsphere_folder" "folder" {
  depends_on    = [vsphere_folder.root]
  path          = format("%s/voltstack", var.vsphere_folder_env)
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}
# voltstack site
module "voltstack-vmware" {
  for_each                  = var.vm_config
  source                    = "../"
  vsphere_datacenter        = var.vsphere_datacenter
  vsphere_cluster           = each.value.vsphere_cluster
  vsphere_folder_env        = var.vsphere_folder_env
  vsphere_folder_path       = vsphere_folder.folder.path
  vm_domain                 = each.value.vm_domain
  vm_datastore              = each.value.vm_datastore
  vm_template               = each.value.vm_template
  vm_name                   = each.key
  vm_cpu                    = each.value.vm_cpu
  vm_ram                    = each.value.vm_ram
  vm_disk0_size             = each.value.vm_disk0_size
  vm_networks               = each.value.vm_networks
  vm_linked_clone           = each.value.vm_linked_clone
  ves_site_token            = var.ves_site_token
  ves_cluster_name          = var.ves_cluster_name
  site_latitude             = var.site_latitude
  site_longitude            = var.site_longitude
  ves_hardware              = var.ves_hardware
  vm_ip                     = each.value.vm_ip
  vm_dns_0                  = each.value.vm_dns_0
  vm_dns_1                  = each.value.vm_dns_1
  default_public_gateway    = each.value.default_public_gateway
  default_route_destination = each.value.default_route_destination
}
