
output "RJ_URL" {
  description = "url to connect to"
  value       = "http://${oci_core_instance.rj_instance.*.public_ip[0]}:8080/rj"
}