# Resources

resource "oci_objectstorage_bucket" "tf_bucket" {
  compartment_id = var.compartment_ocid
  name           = var.obs_name
  namespace      = var.namespace
  access_type    = var.bucket_access_type
}


