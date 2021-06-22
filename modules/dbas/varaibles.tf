variable "database_admin_password" {
  type        = string
  description = "provide value of Database Password"
}

variable "database_db_unique_name" {
  type        = string
  description = "provide value of Database Unique Name"
}

variable "database_db_workload" {
  type        = string
  description = "provide value of Database workload"
}

variable "database_pdb_name" {
  type        = string
  description = "provide value of Database PDB Name"
}

variable "database_version" {
  type        = string
  description = "provide value of Database Version"
}

variable "database_shape" {
  type        = string
  description = "provide value of Database Shape"
}

variable "database_shape_prod" {
  type        = string
  description = "provide value of Database Shape for Production DB"
}

variable "database_storage" {
  type        = string
  description = "provide value of Database Storage"
}

variable "database_storage_prod" {
  type        = string
  description = "provide value of Database Storage for Production DB"
}

variable "database_edition" {
  type        = string
  description = "provide value of Database Edition"
}

variable "database_ssh_pub_key" {
  type        = string
  description = "provide value of Database Public SSH Key"
}

variable "database_nodecount" {
  type        = string
  description = "provide value of Database Node Count"
}