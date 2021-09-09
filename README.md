# terraform vmware voltstack module
module for deploying volterra stack in vmware
---

## running
```bash
. init.sh
cd examples
# load the ovas as templates to vcenter
cp admin.auto.tfvars.example admin.auto.tfvars
## edit vars
setup
```

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
