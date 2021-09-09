# terraform vmware voltstack module
module for deploying volterra stack in vmware
---

## running examples
```bash
. init.sh
cd examples
# load the ovas as templates to vcenter
cp admin.auto.tfvars.example admin.auto.tfvars
## edit vars
setup
```

## example remote source
```hcl
# voltstack site
module "voltstack-vmware" {
  for_each                  = var.vm_config
  source                    = "git::https://github.com/vinnie357/terraform-vmware-voltstack/?ref=main"
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
```
## devcontainer
includes:
- pre-commit
- go
- docker
- terraform
- terraform-docs
## Development

don't forget to add your git user config

```bash
git config --global user.name "myuser"
git config --global user.email "myuser@domain.com"
```
---

checking for secrets as well as linting is performed by git pre-commit with the module requirements handled in the devcontainer.

testing pre-commit hooks:
  ```bash
  # test pre commit manually
  pre-commit run -a -v
  ```
---
