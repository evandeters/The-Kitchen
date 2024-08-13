resource "vsphere_virtual_machine" "vm" {
  for_each = {
    for index, vm in local.virtual_machines :
    vm.name => vm
  }
  name             = each.value.name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "00-Critical/"
  num_cpus         = 4
  memory           = 16384
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types.0
  }
  disk {
    label            = "disk0"
    size             = 200
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = each.value.name
        domain    = "sdc.cpp"
      }
      network_interface {
        ipv4_address = each.value.ip
        ipv4_netmask = 24
      }
      ipv4_gateway    = "10.128.30.1"
      dns_server_list = ["10.128.30.20", "10.128.30.21"]
      dns_suffix_list = ["sdc.cpp"]
    }
  }
}
