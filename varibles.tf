# config

#*************************************
#           TF Requirements
#*************************************
variable "tenancy_ocid" {
  default = ""
}
variable "region" {
  default = ""
}
variable "user_ocid" {
  default = ""
}
variable "private_key_path"{
  default = ""
}
variable "fingerprint"{
  default = ""
}
variable "compartment_ocid" {
  default = ""
}
# switces
variable "vcn_use_existing" { }
variable "adw_enabled" { }
variable "atp_enabled" { }
variable "ajd_enabled" {  }
variable "oac_enabled" {  }
variable "obs_enabled" { }
variable "dbas_enabled" { }

# SSH Keys
variable "ssh_public_key" { default = "" }

# Virtual Cloud Network
variable "vcn_compartment_ocid" { default = "" }
variable "vcn_existing" { default = "" }
variable "subnet_public_existing" { default = "" }
variable "subnet_private_existing" { default = "" }
variable "subnet_public_displayname" { default = "Relational Junction - Public" }
variable "subnet_public_cidr" { default = "10.0.0.0/24" }
variable "subnet_private_displayname" { default = "Relational Junction - Private" }
variable "subnet_private_cidr" { default = "10.0.1.0/24" }
variable "pub_subnet_dns_label" { default = "rjpublic" }
variable "pvt_subnet_dns_label" { default = "rjprivate" }
variable "IGW_displayname" { default = "Relational Junction IGW" }
variable "vcn_cider_block" { default = "10.0.0.0/16" }
variable "pvt_sl_displayname" { default = "Relational Junction - Private SL" }
variable "pub_sl_displayname" { default = "Relational Junction - Public SL" }
variable "pvt_rt_displayname" { default = "Relational Junction - Private RT" }
variable "pub_rt_displayname" { default = "Relational Junction - Public RT" }
variable "vcn_dns_label" { default = "rjvcn" }
variable "VCN_displayname" { default = "Relational Junction VCN" }
variable "nat_displayname" { default = "Relational Junction NAT" }

# Autonomous Data Warehouse
variable "ADW_autonomous_database_cpu_core_count" { default = "1" }
variable "ADW_autonomous_database_admin_password" { default = "" }
variable "ADW_autonomous_database_db_name" { default = "ADWDB" }
variable "ADW_autonomous_database_display_name" { default = "My ADW DB" }
variable "ADW_autonomous_database_db_version" { default = "19c" }
variable "ADW_autonomous_database_is_auto_scaling_enabled" { default = "false" }
variable "ADW_autonomous_database_data_storage_size_in_tbs" { default = "1" }
variable "ADW_autonomous_database_license_model" { default = "BRING_YOUR_OWN_LICENSE" }
variable "ADW_autonomous_database_data_safe_status" { default = "NOT_REGISTERED" }

# Autonomous Data Warehouse
variable "ATP_autonomous_database_cpu_core_count" { default = "1" }
variable "ATP_autonomous_database_admin_password" { default = "" }
variable "ATP_autonomous_database_db_name" { default = "ATPDB" }
variable "ATP_autonomous_database_display_name" { default = "My ATP DB" }
variable "ATP_autonomous_database_db_version" { default = "19c" }
variable "ATP_autonomous_database_is_auto_scaling_enabled" { default = "false" }
variable "ATP_autonomous_database_data_storage_size_in_tbs" { default = "1" }
variable "ATP_autonomous_database_license_model" { default = "BRING_YOUR_OWN_LICENSE" }
variable "ATP_autonomous_database_data_safe_status" { default = "NOT_REGISTERED" }

# Autonomous Data Warehouse
variable "AJD_autonomous_database_cpu_core_count" { default = "1" }
variable "AJD_autonomous_database_admin_password" { default = "" }
variable "AJD_autonomous_database_db_name" { default = "AJDDB" }
variable "AJD_autonomous_database_display_name" { default = "My AJD DB" }
variable "AJD_autonomous_database_db_version" { default = "19c" }
variable "AJD_autonomous_database_is_auto_scaling_enabled" { default = "false" }
variable "AJD_autonomous_database_data_storage_size_in_tbs" { default = "1" }
variable "AJD_autonomous_database_data_safe_status" { default = "NOT_REGISTERED" }

# Relational Junction Server
variable "rj_instance_name" { default = "" }
variable "rj_shape" { default = "" }
variable "rj_type" { default = "" }
variable "ad_number" { default = "" }

# Database
variable "database_admin_password" { default = "" }
variable "database_db_unique_name" { default = "DEVDB" }
variable "database_pdb_name" { default = "PDB1" }
variable "database_version" { default = "21.1.0.0" }
variable "database_shape" { default = "VM.Standard2.1" }
variable "database_storage" { default = "1024" }
variable "database_edition" { default = "STANDARD_EDITION" }
variable "database_nodecount" { default = "1" }
variable "database_hostname" { default = "Analytics" }
variable "database_display_name" { default = "Dev_Analytics_DB" }

# Oracle Analytics Cloud
variable "oac_name" { default = "TFtest" }
variable "oac_capacity_type" { default = "OLPU_COUNT" }
variable "oac_capacity_value" { default = "1" }
variable "oac_feature_set" { default = "ENTERPRISE_ANALYTICS" }
variable "oac_license_type" { default = "LICENSE_INCLUDED" }
variable "oac_idcs_token" { default = "" }

#Object Storage
variable "obs_name" { default = "RJ OBS Target" }
variable "namespace" { default = "" }
variable "bucket_access_type" { default = "NoPublicAccess" }

