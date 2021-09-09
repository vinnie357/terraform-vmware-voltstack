data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vm_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}
// data "vsphere_network" "network_public" {
//   name          = var.vm_network_public
//   datacenter_id = data.vsphere_datacenter.dc.id
// }


// data "vsphere_network" "network_internal" {
//   name          = var.vm_network_internal
//   datacenter_id = data.vsphere_datacenter.dc.id
// }

data "vsphere_network" "network" {
  for_each      = var.vm_networks
  name          = each.value
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}
