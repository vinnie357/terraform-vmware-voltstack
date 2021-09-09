
variable "vsphere_user" {
  description = "vSphere user name"
}

variable "vsphere_password" {
  description = "vSphere password"
}

variable "vsphere_vcenter" {
  description = "vCenter server FQDN or IP"
}
variable "vsphere_datacenter" {
  description = "vSphere datacenter"
}
variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
}
variable "vsphere_folder_env" {
  description = "vsphere environment folder"
  default     = "volterra-dev"

}
# volterra
variable "ves_site_token" {
  description = "site token to register with"
}
variable "ves_cluster_name" {
  description = "site name in volterra"
}
variable "site_latitude" {
  description = "site latitude"
}
variable "site_longitude" {
  description = "site longitude"
}
variable "ves_hardware" {
  description = "volterra hardware type default vmware-voltstack-combo | vmware-multi-nic-voltstack-combo"
  default     = "vmware-voltstack-combo"
}
// vmware config
variable "vm_config" {
  description = "Map of Vmware config"
  type        = map(any)
  default = {
    voltstack-0 = {
      vm_domain       = "my-domain.com"
      vsphere_cluster = "my-cluster"
      vm_datastore    = "my-datastore1"
      vm_cpu          = "4"
      vm_ram          = "16384"
      vm_disk0_size   = "40"
      vm_networks = {
        eth0 = "192.168.1.0"
        eth1 = "192.168.3.0"
      }
      vm_template = "voltstack-1nic"
      #vm_template         = "voltstack-2nic"
      vm_linked_clone = "false"
      # leave unset for dhcp
      vm_ip                     = ""
      vm_dns_0                  = ""
      vm_dns_1                  = ""
      default_route_destination = ""
      # set for static
      #vm_ip               = "192.168.1.187/24"
      #vm_dns_0            = "192.168.3.1"
      #vm_dns_1            = "192.168.2.251"
      #default_route_destination = "0.0.0.0/0"
      #default_public_gateway    = "192.168.1.254"
    },
    voltstack-1 = {
      vm_domain       = "my-domain.com"
      vsphere_cluster = "my-cluster"
      vm_datastore    = "my-datastore1"
      vm_cpu          = "4"
      vm_ram          = "16384"
      vm_disk0_size   = "40"
      vm_networks = {
        eth0 = "192.168.1.0"
        eth1 = "192.168.3.0"
      }
      vm_template = "voltstack-1nic"
      #vm_template         = "voltstack-2nic"
      vm_linked_clone = "false"
      # leave unset for dhcp
      vm_ip                     = ""
      vm_dns_0                  = ""
      vm_dns_1                  = ""
      default_route_destination = ""
      # set for static
      #vm_ip               = "192.168.1.188/24"
      #vm_dns_0            = "192.168.3.1"
      #vm_dns_1            = "192.168.2.251"
      #default_route_destination = "0.0.0.0/0"
      #default_public_gateway    = "192.168.1.254"
    },
    voltstack-2 = {
      vm_domain       = "my-domain.com"
      vsphere_cluster = "my-cluster"
      vm_datastore    = "my-datastore1"
      vm_cpu          = "4"
      vm_ram          = "16384"
      vm_disk0_size   = "40"
      vm_networks = {
        eth0 = "192.168.1.0"
        eth1 = "192.168.3.0"
      }
      vm_template = "voltstack-1nic"
      #vm_template         = "voltstack-2nic"
      vm_linked_clone = "false"
      # leave unset for dhcp
      vm_ip                     = ""
      vm_dns_0                  = ""
      vm_dns_1                  = ""
      default_route_destination = ""
      # set for static
      #vm_ip               = "192.168.1.189/24"
      #vm_dns_0            = "192.168.3.1"
      #vm_dns_1            = "192.168.2.251"
      #default_route_destination = "0.0.0.0/0"
      #default_public_gateway    = "192.168.1.254"
    }
  }
}
## vault
variable "vaultToken" {
  description = "vault token for run"
  default     = ""
}
variable "vaultPort" {
  description = "vault server port"
  default     = 443
}
variable "vaultHost" {
  description = "vault server host"
  default     = ""
}
variable "vaultProtcol" {
  description = "HTTP service type"
  default     = "https"
}
