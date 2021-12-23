resource "huaweicloud_cce_cluster" "this" {
  name                   = var.name
  flavor_id              = var.flavor_id
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  multi_az               = true
  container_network_type = "overlay_l2"
}

resource "huaweicloud_cce_node_pool" "this" {
  for_each          = var.node_pool
  name              = each.value.name
  os                = each.value.os
  flavor_id         = each.value.flavor_id
  availability_zone = try(each.value.availability_zone, "random")

  scall_enable             = try(each.value.scall_enable, false)
  initial_node_count       = try(each.value.initial_node_count, 1)
  min_node_count           = try(each.value.min_node_count, 0)
  max_node_count           = try(each.value.max_node_count, 0)
  scale_down_cooldown_time = try(each.value.scale_down_cooldown_time, 0)
  priority                 = try(each.value.priority, 0)

  cluster_id = huaweicloud_cce_cluster.this.id
  key_pair   = var.node_pool_key_pair
  type       = "vm"


  root_volume {
    size       = 40
    volumetype = "SAS"
  }
  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}
