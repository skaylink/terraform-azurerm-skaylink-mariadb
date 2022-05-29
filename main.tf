# A Terraform module to create a subset of cloud components
# Copyright (C) 2022 Skaylink GmbH

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# For questions and contributions please contact info@iq3cloud.com

resource "azurerm_mariadb_server" "db_server" {
  name                = var.server_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku_name = var.sku

  storage_mb                   = var.storage
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = true

  administrator_login          = var.administrator_login
  administrator_login_password = var.password
  version                      = "10.3"
  ssl_enforcement_enabled      = true

  tags = {
    environment = var.environment_name
  }
}

resource "azurerm_mariadb_database" "db" {
  for_each = toset(var.databases)

  name                = each.value
  resource_group_name = data.azurerm_resource_group.rg.name
  server_name         = azurerm_mariadb_server.db_server.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}

resource "azurerm_mariadb_firewall_rule" "allow_client_ip" {
  for_each = var.allowed_client_ip

  name                = each.value.rule_name
  resource_group_name = data.azurerm_resource_group.rg.name
  server_name         = azurerm_mariadb_server.db_server.name
  start_ip_address    = each.value.ip_address
  end_ip_address      = each.value.ip_address
}
