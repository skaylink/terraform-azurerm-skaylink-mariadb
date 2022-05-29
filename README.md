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