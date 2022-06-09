# Skaylink Terraform module; MariaDB

Deploys a MariaDB instance with the desired amount of databases for your use case. Allows you to quickly and easily add your client IP to the server for login. See below for example.

#### Setting `allowed_client_ip`

```hcl
allowed_client_ip = {
  max = {
    rule_name  = "max-home"
    ip_address = "219.177.164.193"
  },
  erika = {
  	rule_name = "erika-home"
  	ip_address = "188.88.210.63"
  }
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mariadb_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_database) | resource |
| [azurerm_mariadb_firewall_rule.allow_client_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_firewall_rule) | resource |
| [azurerm_mariadb_server.db_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_server) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | username of the administrator account | `string` | `"cspadmin"` | no |
| <a name="input_allowed_client_ip"></a> [allowed\_client\_ip](#input\_allowed\_client\_ip) | The allowed client IPs | `map(any)` | n/a | yes |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | The backup retention period in days | `number` | `7` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | The names of the databases to be created | `list(string)` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The name of the environment to deploy the instance in, commonly used names are dev, qa and prod. | `string` | `"dev"` | no |
| <a name="input_password"></a> [password](#input\_password) | The password of the administrator user | `string` | n/a | yes |
| <a name="input_public_network_access"></a> [public\_network\_access](#input\_public\_network\_access) | Whether or not to allow connections from the internet | `bool` | `false` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group to deploy server in. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | The desired name of the server | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The mariadb SKU you want to deploy | `string` | `"GP_Gen5_2"` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | The amount of storage to provision for the server | `string` | `"51200"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_fqdn"></a> [server\_fqdn](#output\_server\_fqdn) | n/a |
<!-- END_TF_DOCS -->