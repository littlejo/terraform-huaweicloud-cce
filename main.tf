resource "huaweicloud_cce_cluster" "this" {
  name                   = var.name
  flavor_id              = var.flavor_id
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  multi_az               = true
  container_network_type = "overlay_l2"
}

resource "huaweicloud_cce_node_pool" "this" {
  count              = 1
  cluster_id         = huaweicloud_cce_cluster.this.id
  name               = var.node_pool_name
  os                 = "EulerOS 2.5"
  initial_node_count = 1
  flavor_id          = var.node_pool_flavor_id
  key_pair           = var.node_pool_key_pair
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
