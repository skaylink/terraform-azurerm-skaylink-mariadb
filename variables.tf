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

variable "resource_group" {
  type        = string
  description = "Resource group to deploy server in."
}

variable "server_name" {
  type        = string
  description = "The desired name of the server"
}

variable "databases" {
  type        = list(string)
  description = "The names of the databases to be created"
}

variable "administrator_login" {
  type        = string
  description = "username of the administrator account"
  default     = "cspadmin"
}

variable "password" {
  type        = string
  description = "The password of the administrator user"
}

variable "environment_name" {
  type        = string
  description = "The name of the environment to deploy the instance in, commonly used names are dev, qa and prod."
  default     = "dev"
}

variable "allowed_client_ip" {
  type        = map(any)
  description = "The allowed client IPs"
}

variable "sku" {
  type        = string
  description = "The mariadb SKU you want to deploy"
  default     = "GP_Gen5_2"
}

variable "public_network_access" {
  type        = bool
  description = "Whether or not to allow connections from the internet"
  default     = false
}

variable "backup_retention_days" {
  type        = number
  description = "The backup retention period in days"
  default     = 7

  validation {
    condition     = var.backup_retention_days <= 35
    error_message = "Variable backup_retention_days must be equal to or below 35 days."
  }
}

variable "storage" {
  type        = string
  default     = "51200"
  description = "The amount of storage to provision for the server"
}
