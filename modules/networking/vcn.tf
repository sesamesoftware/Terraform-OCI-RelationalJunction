resource "oci_core_vcn" "rj-vcn" {
  count          = var.vcn_use_existing ? 0 : 1
  cidr_block     = var.vcn_cider_block
  compartment_id = var.compartment_ocid
  display_name   = var.VCN_displayname
  dns_label      = var.vcn_dns_label
}