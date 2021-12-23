resource "huaweicloud_cce_cluster" "this" {
  name                   = var.name
  flavor_id              = var.flavor_id
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  multi_az               = true
  container_network_type = "overlay_l2"
}

resource "huaweicloud_cce_node_pool" "this" {
  for_each  = var.node_pool
  name      = each.value.name
  os        = each.value.os
  flavor_id = each.value.flavor_id

  scall_enable = false
  cluster_id   = huaweicloud_cce_cluster.this.id
  key_pair     = var.node_pool_key_pair
  type         = "vm"

  initial_node_count = 1

  root_volume {
    size       = 40
    volumetype = "SAS"
  }
  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}
