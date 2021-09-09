// data "template_file" "userdata" {
//   template = file("./templates/userdata.yml.tpl")
//   vars = {
//     VAULT_TOKEN   = var.vaultToken
//     VAULT_PORT    = var.vaultPort
//     VAULT_HOST    = var.vaultHost
//     VAULT_PROTCOL = var.vaultProtcol
//     SECRET_NAME   = "volterra"
//   }
// }
resource "vsphere_virtual_machine" "voltstack" {
  name             = "${var.vm_name}-${var.vsphere_folder_env}.${var.vm_domain}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vsphere_folder_path

  // tags = [vsphere_tag.Application.id, var.vm_tags_environment]

  num_cpus = var.vm_cpu
  memory   = var.vm_ram
  guest_id = data.vsphere_virtual_machine.template.guest_id

  dynamic "network_interface" {
    for_each = data.vsphere_network.network
    content {
      network_id   = network_interface.value["id"]
      adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
    }
  }

  disk {
    label            = "${var.vm_name}.vmdk"
    size             = var.vm_disk0_size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  cdrom {
    client_device = true
  }
  // extra_config = {
  //   // "guestinfo.metadata"          = base64encode(data.template_file.metadata.rendered)
  //   // "guestinfo.metadata.encoding" = "base64"
  //   // "guestinfo.userdata"          = base64encode(data.template_file.userdata.rendered)
  //   // "guestinfo.userdata.encoding" = "base64"
  // }
  vapp {
    properties = {
      "guestinfo.ves.certifiedhardware" = var.ves_hardware
      "guestinfo.hostname"              = format("%s-%s", var.vm_name, var.vsphere_folder_env)
      "guestinfo.ves.token"             = var.ves_site_token
      "guestinfo.ves.clustername"       = var.ves_cluster_name
      "guestinfo.ves.latitude"          = var.site_latitude
      "guestinfo.ves.longitude"         = var.site_longitude
      //"guestinfo.userdata"            = base64encode(data.template_file.userdata.rendered)
      //static public
      "guestinfo.interface.0.ip.0.address"        = var.vm_ip
      "guestinfo.dns.server.0"                    = var.vm_dns_0
      "guestinfo.dns.server.1"                    = var.vm_dns_1
      "guestinfo.interface.0.route.0.destination" = var.default_route_destination
      "guestinfo.interface.0.route.0.gateway"     = var.default_public_gateway
    }
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    linked_clone  = var.vm_linked_clone
  }
}
