/*
Local Variables
 */
locals {
  public_subnet_id  = var.vcn_use_existing ? var.subnet_public_existing : module.vcn.public-subnetid
  private_subnet_id = var.vcn_use_existing ? var.subnet_private_existing : module.vcn.private-subnetid
}
/* Virtual Cloud Network  */
module "vcn" {
  source                     = "./modules/networking"
  compartment_ocid           = var.vcn_compartment_ocid != "" ? var.vcn_compartment_ocid : var.compartment_ocid
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
  source                                       = "./modules/Databases/ADb"
  count                                        = var.adw_enabled == true ? 1 : 0
  autonomous_database_admin_password           = var.ADW_autonomous_database_admin_password
  compartment_ocid                             = var.compartment_ocid
  autonomous_database_cpu_core_count           = var.ADW_autonomous_database_cpu_core_count
  autonomous_database_data_storage_size_in_tbs = var.ADW_autonomous_database_data_storage_size_in_tbs
  autonomous_database_db_name                  = var.ADW_autonomous_database_db_name
  autonomous_database_db_version               = var.ADW_autonomous_database_db_version
  autonomous_database_data_safe_status         = var.ADW_autonomous_database_data_safe_status
  autonomous_database_db_workload              = "DW"
  autonomous_database_display_name             = var.ADW_autonomous_database_display_name
  autonomous_database_is_auto_scaling_enabled  = var.ADW_autonomous_database_is_auto_scaling_enabled
  autonomous_database_license_model            = var.ADW_autonomous_database_license_model
}

//Autonomous Transactin Procesing

module "atp" {
  source                                       = "./modules/Databases/ADb"
  count                                        = var.atp_enabled == true ? 1 : 0
  autonomous_database_admin_password           = var.ATP_autonomous_database_admin_password
  compartment_ocid                             = var.compartment_ocid
  autonomous_database_cpu_core_count           = var.ATP_autonomous_database_cpu_core_count
  autonomous_database_data_storage_size_in_tbs = var.ATP_autonomous_database_data_storage_size_in_tbs
  autonomous_database_db_name                  = var.ATP_autonomous_database_db_name
  autonomous_database_db_version               = var.ATP_autonomous_database_db_version
  autonomous_database_data_safe_status         = var.ATP_autonomous_database_data_safe_status
  autonomous_database_db_workload              = "OLTP"
  autonomous_database_display_name             = var.ATP_autonomous_database_display_name
  autonomous_database_is_auto_scaling_enabled  = var.ATP_autonomous_database_is_auto_scaling_enabled
  autonomous_database_license_model            = var.ATP_autonomous_database_license_model
}
//Autonomous JSON Database

module "ajd" {
  source                                       = "./modules/Databases/ADb"
  count                                        = var.ajd_enabled == true ? 1 : 0
  autonomous_database_admin_password           = var.AJD_autonomous_database_admin_password
  compartment_ocid                             = var.compartment_ocid
  autonomous_database_cpu_core_count           = var.AJD_autonomous_database_cpu_core_count
  autonomous_database_data_storage_size_in_tbs = var.AJD_autonomous_database_data_storage_size_in_tbs
  autonomous_database_db_name                  = var.AJD_autonomous_database_db_name
  autonomous_database_db_version               = var.AJD_autonomous_database_db_version
  autonomous_database_data_safe_status         = var.AJD_autonomous_database_data_safe_status
  autonomous_database_db_workload              = "AJD"
  autonomous_database_display_name             = var.AJD_autonomous_database_display_name
  autonomous_database_is_auto_scaling_enabled  = var.AJD_autonomous_database_is_auto_scaling_enabled
  autonomous_database_license_model            = "LICENSE_INCLUDED"
}
// Database

module "dbas" {
  source                  = "./modules/Databases/dbas"
  count                   = var.dbas_enabled == true ? 1 : 0
  depends_on              = [module.vcn]
  compartment_ocid        = var.compartment_ocid
  tenancy_ocid            = var.tenancy_ocid
  ad_number               = var.ad_number
  database_admin_password = var.database_admin_password
  database_db_unique_name = var.database_db_unique_name
  database_db_workload    = "OLTP"
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
  source           = "./modules/relationalJunction"
  compartment_ocid = var.compartment_ocid
  depends_on       = [module.vcn, module.adw]
  rj_shape         = var.rj_shape
  rj_instance_name = var.rj_instance_name
  subnet_id        = local.public_subnet_id
  ssh_public_key   = var.ssh_public_key
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  rj_type          = var.rj_type
}



//Oracle Analytics Cloud

module "oac" {
  source             = "./modules/oac"
  count              = var.oac_enabled == true ? 1 : 0
  oac_enabled        = var.oac_enabled
  oac_capacity_type  = var.oac_capacity_type
  oac_capacity_value = var.oac_capacity_value
  compartment_ocid   = var.compartment_ocid
  oac_feature_set    = var.oac_feature_set
  oac_license_type   = var.oac_license_type
  oac_idcs_token     = var.oac_idcs_token
  oac_name           = var.oac_name
}

module "obs" {
  source             = "./modules/objectStorage"
  count              = var.obs_enabled == true ? 1 : 0
  obs_name           = var.obs_name
  namespace          = var.namespace
  compartment_ocid   = var.compartment_ocid
  bucket_access_type = var.bucket_access_type
}

output "RJ_URL" {
  description = "url to connect to Relational Junction"
  value       = module.rj.RJ_URL
}

