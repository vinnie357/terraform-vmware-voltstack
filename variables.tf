#====================#
# vCenter connection #
#====================#

variable "vsphere_datacenter" {
  description = "vSphere datacenter"
}

variable "vsphere_cluster" {
  description = "vSphere cluster"
}

variable "vsphere_folder_path" {
  description = "vsphere environment folder"
  default     = "volterra-dev/voltsite"

}
variable "vsphere_folder_env" {
  description = "vsphere environment folder"
  default     = "volterra-dev"

}
#=========================#
# vSphere virtual machine #
#=========================#
variable "vm_datastore" {
  description = "Datastore used for the vSphere virtual machines"
}
variable "vm_networks" {
  description = "map of networks and interfaces"
}
// variable "vm_network_public" {
//   description = "Network used for the vSphere virtual machines public interface"
// }
// variable "vm_network_internal" {
//   description = "Network used for the vSphere virtual machines internal interface"
// }

variable "vm_template" {
  description = "Template used to create the vSphere virtual machines"
  default     = "voltstack-1nic"
}

variable "vm_linked_clone" {
  description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
  default     = "false"
}

variable "vm_ip" {
  description = "Ip with netmask used for the vSphere virtual machine 192.168.2.0/24"
  default     = ""
}
variable "default_public_gateway" {
  description = "default gateway address for public interface"
  default     = ""
}
variable "default_route_destination" {
  description = "Default gateway for outside network interface: empty by default. If DHCP was set to no then you can configure the default gateway for your network here. Example: 10.1.1.254"
  default     = ""
}

variable "vm_gateway" {
  description = "Gateway for the vSphere virtual machine"
  default     = ""
}
variable "vm_dns_0" {
  description = "DNS for the vSphere virtual machine"
  default     = ""
}
variable "vm_dns_1" {
  description = "DNS for the vSphere virtual machine"
  default     = ""
}

variable "vm_domain" {
  description = "Domain for the vSphere virtual machine"
}

variable "vm_cpu" {
  description = "Number of vCPU for the vSphere virtual machines"
  default     = "4"
}

variable "vm_ram" {
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
  default     = "16384"
}

variable "vm_name" {
  description = "The name of the vSphere virtual machines and the hostname of the machine"
  default     = "voltstack"
}

variable "vm_disk0_size" {
  description = "The size in GB of the primary disk drive"
  default     = "40"
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
  description = "volterra hardware type default"
  default     = "vmware-multi-nic-voltstack-combo"
}
