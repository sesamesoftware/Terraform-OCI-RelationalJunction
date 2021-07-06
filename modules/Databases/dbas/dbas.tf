data "oci_identity_availability_domain" "ad" {
    #Required
    compartment_id = var.tenancy_ocid
    #Optional (one or the other is required)
    ad_number = var.ad_number
}
resource "oci_database_db_system" "dev_db_system" {
  #Required
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  db_home {
    #Required
    database {
      #Required
      admin_password = var.database_admin_password
      db_name        = var.database_db_unique_name
      db_workload    = var.database_db_workload
      pdb_name       = var.database_pdb_name

    }

    #Optional
    db_version   = var.database_version
    display_name = var.database_display_name
  }
  hostname                = var.database_hostname
  shape                   = var.database_shape
  ssh_public_keys         = [var.ssh_public_keys]
  subnet_id               = var.subnet_id
  data_storage_size_in_gb = var.database_storage
  database_edition        = var.database_edition
  display_name            = var.database_display_name
  domain                  = var.domain # domain should be same as subnet
  node_count              = var.database_nodecount
} 
