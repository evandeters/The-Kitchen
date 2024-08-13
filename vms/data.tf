data "vsphere_datacenter" "dc" {
  name = "StudentDatacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "Ursula"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "0030_CriticalNetwork"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "K8s Template"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "Disneyland/Resources/00_Critical/k8s"
  datacenter_id = data.vsphere_datacenter.dc.id
}
