output "private-subnetid" {
  description = "oci_core_subnet"
  sensitive = false
  value       = "${oci_core_subnet.rj-private-subnet[0].id}"
}
output "public-subnetid" {
  description = "oci_core_subnet"
  sensitive = false
  value       = "${oci_core_subnet.rj-public-subnet[0].id}"
}
output "Public_Subnet_Dns" {
  description = "oci_core_subnet"
  sensitive = false
  value       = "${oci_core_subnet.rj-public-subnet[0].subnet_domain_name}"
}
output "Private_Subnet_Dns" {
  description = "oci_core_subnet"
  sensitive = false
  value       = "${oci_core_subnet.rj-private-subnet[0].subnet_domain_name}"
}