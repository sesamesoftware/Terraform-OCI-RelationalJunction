# config
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}

# switces
variable "vcn_use_existing" {}
variable "adw_enabled" {}
variable "atp_enabled" {}
variable "ajd_enabled" {}
variable "oac_enabled" {}
variable "obs_enabled" {}
variable "dbas_enabled" {}

# SSH Keys
variable "ssh_public_key" {}

# Virtual Cloud Network
variable "vcn_existing" {}
variable "subnet_public_existing" {}
variable "subnet_private_existing" {}
variable "subnet_public_displayname" {}
variable "subnet_public_cidr" {}
variable "subnet_private_displayname" {}
variable "subnet_private_cidr" {}
variable "pub_subnet_dns_label" {}
variable "pvt_subnet_dns_label" {}
variable "IGW_displayname" {}
variable "vcn_cider_block" {}
variable "pvt_sl_displayname" {}
variable "pub_sl_displayname" {}
variable "pvt_rt_displayname" {}
variable "pub_rt_displayname" {}
variable "vcn_dns_label" {}
variable "VCN_displayname" {}
variable "nat_displayname" {}

# Autonomous Data Warehouse
variable "ADW_autonomous_database_cpu_core_count" {}
variable "ADW_autonomous_database_admin_password" {}
variable "ADW_autonomous_database_db_name" {}
variable "ADW_autonomous_database_display_name" {}
variable "ADW_autonomous_database_db_version" {}
variable "ADW_autonomous_database_is_auto_scaling_enabled" {}
variable "ADW_autonomous_database_data_storage_size_in_tbs" {}
variable "ADW_autonomous_database_license_model" {}
variable "ADW_autonomous_database_data_safe_status" {}

# Autonomous Data Warehouse
variable "ATP_autonomous_database_cpu_core_count" {}
variable "ATP_autonomous_database_admin_password" {}
variable "ATP_autonomous_database_db_name" {}
variable "ATP_autonomous_database_display_name" {}
variable "ATP_autonomous_database_db_version" {}
variable "ATP_autonomous_database_is_auto_scaling_enabled" {}
variable "ATP_autonomous_database_data_storage_size_in_tbs" {}
variable "ATP_autonomous_database_license_model" {}
variable "ATP_autonomous_database_data_safe_status" {}

# Autonomous Data Warehouse
variable "AJD_autonomous_database_cpu_core_count" {}
variable "AJD_autonomous_database_admin_password" {}
variable "AJD_autonomous_database_db_name" {}
variable "AJD_autonomous_database_display_name" {}
variable "AJD_autonomous_database_db_version" {}
variable "AJD_autonomous_database_is_auto_scaling_enabled" {}
variable "AJD_autonomous_database_data_storage_size_in_tbs" {}
variable "AJD_autonomous_database_data_safe_status" {}

# Relational Junction Server
variable "rj_instance_name" {}
variable "rj_shape" {}
variable "rj_type" {}
variable "ad_number" {}
variable "tags" {}
variable "instance_shape_config_memory_in_gbs"{}

# Database
variable "database_admin_password" {}
variable "database_db_unique_name" {}
variable "database_db_workload" {}
variable "database_pdb_name" {}
variable "database_version" {}
variable "database_shape" {}
variable "database_storage" {}
variable "database_edition" {}
variable "database_nodecount" {}
variable "database_hostname" {}
variable "database_display_name" {}

# Oracle Analytics Cloud
variable "oac_name" {}
variable "oac_description" {}
variable "oac_capacity_type" {}
variable "oac_capacity_value" {}
variable "oac_capacity_value_prod" {}
variable "oac_feature_set" {}
variable "oac_license_type" {}
variable "oac_idcs_token" {}

#Object Storage
variable "obs_name" {}
variable "namespace" {}
variable "bucket_access_type" {}