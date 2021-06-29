/* 
Git hub Repository for OCI modules used to build RJ Stack, includes ADB Systems, DBAS, OAC, Relational Junction, and VCN
 */
module "source" {
  source = "git::github.com/sesamesoftware/Terraform-Modules-OCI.git"
}
/*
Local Variables
 */
locals {
  public_subnet_id  = var.vcn_use_existing ? var.subnet_public_existing : module.vcn.public-subnetid
  private_subnet_id = var.vcn_use_existing ? var.subnet_private_existing : module.vcn.private-subnetid
  }
/* Virtual Cloud Network  */
module "vcn" {
  source                     = "./.terraform/modules/source/networking"
  compartment_ocid           = var.compartment_ocid
  subnet_public_displayname  = var.subnet_public_displayname
  subnet_public_cidr         = var.subnet_public_cidr
  subnet_private_displayname = var.subnet_private_displayname
  subnet_private_cidr        = var.subnet_private_cidr
  vcn_use_existing           = false
  pub_subnet_dns_label       = var.pub_subnet_dns_label
  pvt_subnet_dns_label       = var.pvt_subnet_dns_label
  IGW_displayname            = var.IGW_displayname
  vcn_cider_block            = var.vcn_cider_block
  pvt_sl_displayname         = var.pvt_sl_displayname
  pub_sl_displayname         = var.pub_sl_displayname
  pvt_rt_displayname         = var.pvt_rt_displayname
  pub_rt_displayname         = var.pub_rt_displayname
  vcn_dns_label              = var.vcn_dns_label
  VCN_displayname            = var.VCN_displayname
  nat_displayname            = var.nat_displayname

}


//Autonomous Data Wearhouse

module "adw" {
  source                                       = "./.terraform/modules/source/Databases/ADb"
  count                                        = var.adw_enabled == true ? 1 : 0
  autonomous_database_admin_password           = var.autonomous_database_admin_password
  compartment_ocid                             = var.compartment_ocid
  autonomous_database_cpu_core_count           = var.autonomous_database_cpu_core_count
  autonomous_database_data_storage_size_in_tbs = var.autonomous_database_data_storage_size_in_tbs
  autonomous_database_db_name                  = var.autonomous_database_db_name
  autonomous_database_db_version               = var.autonomous_database_db_version
  autonomous_database_data_safe_status         = var.autonomous_database_data_safe_status
  autonomous_database_db_workload              = "DW"
  autonomous_database_display_name             = var.autonomous_database_display_name
  autonomous_database_is_auto_scaling_enabled  = var.autonomous_database_is_auto_scaling_enabled
  autonomous_database_license_model            = var.autonomous_database_license_model
  adw_enabled                                  = var.adw_enabled
  walletPath                                   = "${var.walletPath}/${var.autonomous_database_db_name}.zip"
}

//Autonomous Transactin Procesing

module "atp" {
  source                                       = "./.terraform/modules/source/Databases/ADb"
  count                                        = var.atp_enabled == true ? 1 : 0
  autonomous_database_admin_password           = var.autonomous_database_admin_password
  compartment_ocid                             = var.compartment_ocid
  autonomous_database_cpu_core_count           = var.autonomous_database_cpu_core_count
  autonomous_database_data_storage_size_in_tbs = var.autonomous_database_data_storage_size_in_tbs
  autonomous_database_db_name                  = var.autonomous_database_db_name
  autonomous_database_db_version               = var.autonomous_database_db_version
  autonomous_database_data_safe_status         = var.autonomous_database_data_safe_status
  autonomous_database_db_workload              = "OLTP"
  autonomous_database_display_name             = var.autonomous_database_display_name
  autonomous_database_is_auto_scaling_enabled  = var.autonomous_database_is_auto_scaling_enabled
  autonomous_database_license_model            = var.autonomous_database_license_model
  adw_enabled                                  = var.adw_enabled
  walletPath                                   = "${var.walletPath}/${var.autonomous_database_db_name}.zip"
}
//Autonomous JSON Database

module "ajd" {
  source                                       = "./.terraform/modules/source/Databases/ADb"
  count                                        = var.ajd_enabled == true ? 1 : 0
  autonomous_database_admin_password           = var.autonomous_database_admin_password
  compartment_ocid                             = var.compartment_ocid
  autonomous_database_cpu_core_count           = var.autonomous_database_cpu_core_count
  autonomous_database_data_storage_size_in_tbs = var.autonomous_database_data_storage_size_in_tbs
  autonomous_database_db_name                  = var.autonomous_database_db_name
  autonomous_database_db_version               = var.autonomous_database_db_version
  autonomous_database_data_safe_status         = var.autonomous_database_data_safe_status
  autonomous_database_db_workload              = "AJD"
  autonomous_database_display_name             = var.autonomous_database_display_name
  autonomous_database_is_auto_scaling_enabled  = var.autonomous_database_is_auto_scaling_enabled
  autonomous_database_license_model            = var.autonomous_database_license_model
  adw_enabled                                  = var.adw_enabled
  walletPath                                   = "${var.walletPath}/${var.autonomous_database_db_name}.zip"
}
// Database

module "DBAS" {
  source                  = "./.terraform/modules/source/Databases/dbas"
  count                   = var.dbas_enabled == true ? 1 : 0
  depends_on              = [module.vcn]
  compartment_ocid        = var.compartment_ocid
  tenancy_ocid            = var.tenancy_ocid
  ad_number               = var.ad_number
  database_admin_password = var.database_admin_password
  database_db_unique_name = var.database_db_unique_name
  database_db_workload    = var.database_db_workload
  database_pdb_name       = var.database_pdb_name
  database_version        = var.database_version
  database_shape          = var.database_shape
  database_storage        = var.database_storage
  database_edition        = var.database_edition
  database_nodecount      = var.database_nodecount
  subnet_id               = local.public_subnet_id
  ssh_public_keys         = var.ssh_public_key
  domain                  = module.vcn.Public_Subnet_Dns
  database_display_name   = var.database_display_name
  database_hostname       = var.database_hostname
}


//Relational Junction 

module "rj" {
  source           = "./.terraform/modules/source/relationalJunction"
  count            = var.rj_enabled == true ? 1 : 0
  compartment_ocid = var.compartment_ocid
  depends_on       = [module.vcn, module.adw]
  rj_shape         = var.rj_shape
  rj_instance_name = var.rj_instance_name
  tags             = var.tags
  subnet_id        = local.public_subnet_id
  ssh_public_key   = var.ssh_public_key
  ssh_private_key  = var.ssh_private_key
  walletPath       = "${path.module}/"
  walletName       = "${var.autonomous_database_db_name}.zip"
  dbname           = var.autonomous_database_db_name
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
}



//Oracle Analytics Cloud

module "oac" {
  source             = "./.terraform/modules/source/oac"
  count              = var.oac_enabled == true ? 1 : 0
  oac_enabled        = var.oac_enabled
  oac_capacity_type  = var.oac_capacity_type
  oac_capacity_value = var.oac_capacity_value
  compartment_ocid   = var.compartment_ocid
  oac_feature_set    = var.oac_feature_set
  oac_license_type   = var.oac_license_type
  oac_idcs_token     = var.oac_idcs_token
  oac_name           = var.oac_name
  oac_description    = var.oac_description
}


module "OBS" {
  source             = "./.terraform/modules/source/ObjectStorage"
  count              = var.obs_enabled == true ? 1 : 0
  obs_name           = var.obs_name
  namespace          = var.namespace
  compartment_ocid   = var.compartment_ocid
  bucket_access_type = var.bucket_access_type
}
