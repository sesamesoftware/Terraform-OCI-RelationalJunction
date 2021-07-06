output "dbConnectionString" {
  value = ["${oci_database_db_system.dev_db_system.db_home[0].database[0].connection_strings }"]
}
