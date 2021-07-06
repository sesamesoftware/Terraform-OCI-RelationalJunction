output "OAC_URL" {
  description = "url to connect to"
  value       = var.oac_enabled ? oci_analytics_analytics_instance.analytics_instance.service_url : null
}
