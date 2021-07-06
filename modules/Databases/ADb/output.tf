
output "ADW_URL" {
  description = "url to connect to"
  value       = var.adw_enabled ? oci_database_autonomous_database.test_autonomous_database.connection_urls : null
}