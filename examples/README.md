## vmware volt site

https://www.volterra.io/docs/how-to/site-management/create-vmw-site

## template prep

### single nic
- deploy ova to vcenter

- take defaults

- don't power on

- take snapshot, name it default

- convert vm to template

- create new vm from template or, use terraform.

- important variables:
```hcl
ves_hardware = "vmware-voltstack-combo"
vm_config = {
  voltstack-0 = {
      vm_networks = {
        eth0 = "192.168.1.0"
      }
  }
}
vm_template      = "voltstack-1nic"
```
### multi-nic

- deploy ova to vcenter

- take defaults

- don't power on

- edit vm

- add 2nd ethernet interface select any network

- take snapshot, name it default

- convert vm to template

- create new vm from template or, use terraform.

- important variables:

```hcl
ves_hardware     = "vmware-multi-nic-voltstack-combo"
vm_config = {
  voltstack-0 = {
    vm_networks = {
      eth0 = "192.168.1.0"
      eth1 = "192.168.3.0"
    }
  }
}
vm_template      = "voltstack-2nic"
```

## modify vars
```bash
cp admin.auto.tfvars.example admin.auto.tfvars
# edit variables for your site.
```
## troubleshooting
```bash
# failed node
terraform taint module.voltstack-vmware[\"voltstack-1\"].vsphere_virtual_machine.voltstack
```
<!-- markdownlint-disable no-inline-html -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| vsphere | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| site\_latitude | site latitude | `any` | n/a | yes |
| site\_longitude | site longitude | `any` | n/a | yes |
| ves\_cluster\_name | site name in volterra | `any` | n/a | yes |
| ves\_site\_token | site token to register with | `any` | n/a | yes |
| vsphere\_datacenter | vSphere datacenter | `any` | n/a | yes |
| vsphere\_password | vSphere password | `any` | n/a | yes |
| vsphere\_unverified\_ssl | Is the vCenter using a self signed certificate (true/false) | `any` | n/a | yes |
| vsphere\_user | vSphere user name | `any` | n/a | yes |
| vsphere\_vcenter | vCenter server FQDN or IP | `any` | n/a | yes |
| vaultHost | vault server host | `string` | `""` | no |
| vaultPort | vault server port | `number` | `443` | no |
| vaultProtcol | HTTP service type | `string` | `"https"` | no |
| vaultToken | vault token for run | `string` | `""` | no |
| ves\_hardware | volterra hardware type default vmware-voltstack-combo \| vmware-multi-nic-voltstack-combo | `string` | `"vmware-voltstack-combo"` | no |
| vm\_config | Map of Vmware config | `map(any)` | <pre>{<br>  "voltstack-0": {<br>    "default_route_destination": "",<br>    "vm_cpu": "4",<br>    "vm_datastore": "my-datastore1",<br>    "vm_disk0_size": "40",<br>    "vm_dns_0": "",<br>    "vm_dns_1": "",<br>    "vm_domain": "my-domain.com",<br>    "vm_ip": "",<br>    "vm_linked_clone": "false",<br>    "vm_networks": {<br>      "eth0": "192.168.1.0",<br>      "eth1": "192.168.3.0"<br>    },<br>    "vm_ram": "16384",<br>    "vm_template": "voltstack-1nic",<br>    "vsphere_cluster": "my-cluster"<br>  },<br>  "voltstack-1": {<br>    "default_route_destination": "",<br>    "vm_cpu": "4",<br>    "vm_datastore": "my-datastore1",<br>    "vm_disk0_size": "40",<br>    "vm_dns_0": "",<br>    "vm_dns_1": "",<br>    "vm_domain": "my-domain.com",<br>    "vm_ip": "",<br>    "vm_linked_clone": "false",<br>    "vm_networks": {<br>      "eth0": "192.168.1.0",<br>      "eth1": "192.168.3.0"<br>    },<br>    "vm_ram": "16384",<br>    "vm_template": "voltstack-1nic",<br>    "vsphere_cluster": "my-cluster"<br>  },<br>  "voltstack-2": {<br>    "default_route_destination": "",<br>    "vm_cpu": "4",<br>    "vm_datastore": "my-datastore1",<br>    "vm_disk0_size": "40",<br>    "vm_dns_0": "",<br>    "vm_dns_1": "",<br>    "vm_domain": "my-domain.com",<br>    "vm_ip": "",<br>    "vm_linked_clone": "false",<br>    "vm_networks": {<br>      "eth0": "192.168.1.0",<br>      "eth1": "192.168.3.0"<br>    },<br>    "vm_ram": "16384",<br>    "vm_template": "voltstack-1nic",<br>    "vsphere_cluster": "my-cluster"<br>  }<br>}</pre> | no |
| vsphere\_folder\_env | vsphere environment folder | `string` | `"volterra-dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| site | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable no-inline-html -->
