resource "huaweicloud_cce_cluster" "this" {
  name                   = var.name
  flavor_id              = var.cluster_flavor
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  multi_az               = true
  container_network_type = "overlay_l2"
}

resource "huaweicloud_cce_node_pool" "this" {
  count              = 1
  cluster_id         = huaweicloud_cce_cluster.this.id
  name               = var.name_node_pool
  os                 = "EulerOS 2.5"
  initial_node_count = 1
  flavor_id          = var.flavor
  key_pair           = var.public_key_name
  scall_enable       = false
  type               = "vm"

  root_volume {
    size       = 40
    volumetype = "SAS"
  }
  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}
