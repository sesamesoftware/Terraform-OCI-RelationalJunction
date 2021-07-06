# Variables

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
variable "private_key_path" {
  default = ""
}
variable "fingerprint" {
  default = ""
}
variable "compartment_ocid" {
  default = ""
}

#*************************************
#         Network Specific
#*************************************

variable "vcn_name" {
  default = "Relational Junction VCN"
}
variable "subnet_public_displayname" {
  default = "Relational Junction - Public"
}
variable "subnet_public_cidr" {
  default = "10.0.0.0/24"
}
variable "subnet_private_displayname" {
  default = "Data Science - Private"
}
variable "subnet_private_cidr" {
  default = "10.0.1.0/24"
}
variable "vcn_use_existing" {
  default = false
}
variable "vcn_existing" {
  default = ""
}
variable "subnet_public_existing" {
  default = ""
}
variable "subnet_private_existing" {
  default = ""
}
variable "pub_subnet_dns_label" {
  default = ""
}
variable "pvt_subnet_dns_label" {
  default = ""
} 
variable "IGW_displayname" {
  default = ""
}
variable "vcn_cider_block" {
  default = "10.0.0.0/16"
}
variable "pvt_sl_displayname" {
  default = ""
}
variable "pub_sl_displayname" {
  default = ""
}
variable "pvt_rt_displayname" {
  default = ""
}
variable "pub_rt_displayname" {
  default = ""
}
variable "vcn_dns_label" {
  default = ""
}
variable "VCN_displayname" {
  default = ""
}
variable "nat_displayname" {
  default = ""
}

