resource "oci_marketplace_accepted_agreement" "rj_accepted_agreement" {
  #Required
  agreement_id    = oci_marketplace_listing_package_agreement.rj_listing_package_agreement.agreement_id
  compartment_id  = var.compartment_ocid
  listing_id      = data.oci_marketplace_listing.rj_listing.id
  package_version = data.oci_marketplace_listing.rj_listing.default_package_version
  signature       = oci_marketplace_listing_package_agreement.rj_listing_package_agreement.signature

}

resource "oci_marketplace_listing_package_agreement" "rj_listing_package_agreement" {
  #Required
  agreement_id    = data.oci_marketplace_listing_package_agreements.rj_listing_package_agreements.agreements.0.id
  listing_id      = data.oci_marketplace_listing.rj_listing.id
  package_version = data.oci_marketplace_listing.rj_listing.default_package_version

}


resource "oci_core_app_catalog_listing_resource_version_agreement" "rj_app_catalog_listing_resource_version_agreement" {
  listing_id               = data.oci_marketplace_listing_package.rj_listing_package.app_catalog_listing_id
  listing_resource_version = data.oci_core_app_catalog_listing_resource_versions.rj_app_catalog_listing_resource_versions.app_catalog_listing_resource_versions[0].listing_resource_version
}

resource "oci_core_app_catalog_subscription" "rj_app_catalog_subscription" {
  compartment_id           = var.compartment_ocid
  eula_link                = oci_core_app_catalog_listing_resource_version_agreement.rj_app_catalog_listing_resource_version_agreement.eula_link
  listing_id               = oci_core_app_catalog_listing_resource_version_agreement.rj_app_catalog_listing_resource_version_agreement.listing_id
  listing_resource_version = oci_core_app_catalog_listing_resource_version_agreement.rj_app_catalog_listing_resource_version_agreement.listing_resource_version
  oracle_terms_of_use_link = oci_core_app_catalog_listing_resource_version_agreement.rj_app_catalog_listing_resource_version_agreement.oracle_terms_of_use_link
  signature                = oci_core_app_catalog_listing_resource_version_agreement.rj_app_catalog_listing_resource_version_agreement.signature
  time_retrieved           = oci_core_app_catalog_listing_resource_version_agreement.rj_app_catalog_listing_resource_version_agreement.time_retrieved
}


//The Relational Junction Server

resource "oci_core_instance" "rj_instance" {
  #Required
  //depends_on          = [oci_database_autonomous_database.test_autonomous_database]
  availability_domain = data.oci_identity_availability_domain.this_stack_ad.name
  compartment_id      = var.compartment_ocid
  shape               = var.rj_shape
  #Optional
  agent_config {
    is_management_disabled = false
    is_monitoring_disabled = false
  }
  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  create_vnic_details {
    assign_public_ip       = true
    display_name           = var.rj_instance_name
    freeform_tags          = var.tags
    skip_source_dest_check = false
    subnet_id              = var.subnet_id
  }
  display_name                        = var.rj_instance_name
  fault_domain                        = "FAULT-DOMAIN-1"
  is_pv_encryption_in_transit_enabled = false

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    //user_data = "${base64encode(file(var.custom_bootstrap_file_name))}"
  }

  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_app_catalog_listing_resource_version.rj_app_catalog_listing_resource_version, "listing_resource_id")
  }
  preserve_boot_volume = true

 
}

