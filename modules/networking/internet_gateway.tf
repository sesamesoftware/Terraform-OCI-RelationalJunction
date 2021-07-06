resource "oci_core_internet_gateway" "rj-internet-gateway" {
  count = var.vcn_use_existing ? 0 : 1
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.rj-vcn[0].id

  #Optional
  display_name = var.IGW_displayname
  enabled      = true
}
