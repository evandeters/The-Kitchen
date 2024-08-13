locals {
  virtual_machines = [
    {
      name = "kube-master-01"
      ip   = "10.128.30.100"
    },
    {
      name = "kube-worker-01"
      ip   = "10.128.30.101"
    },
    {
      name = "kube-worker-02"
      ip   = "10.128.30.102"
    },
    {
      name = "kube-worker-03"
      ip   = "10.128.30.103"
    },
    {
      name = "kube-worker-04"
      ip   = "10.128.30.104"
    }
  ]

  username = "username"
  password = "password"
}


