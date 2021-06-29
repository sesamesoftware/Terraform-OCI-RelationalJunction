output "OAC_URL" {
  description = "url to connect to OAC"
  value       = var.oac_enabled ? module.oac[0].OAC_URL : null
}

output "RJ_URL" {
  description = "url to connect to Relational Junction"
  value       = var.rj_enabled ? module.rj[0].RJ_URL : null
}

output "dbConnectionString" {
  description = "url to connect to Relational Junction"
  value       = var.dbas_enabled ? module.DBAS[0].dbConnectionString : null
}

output "ADW_URL" {
  description = "url to connect to ADW"
  value       = var.adw_enabled ? module.adw[0].ADW_URL : null
}