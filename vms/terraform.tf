terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.8.2"
    }
  }
}

provider "vsphere" {
  user                 = local.username
  password             = local.password
  vsphere_server       = "elsa.sdc.cpp"
  allow_unverified_ssl = true
}

