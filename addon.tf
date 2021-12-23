data "huaweicloud_cce_addon_template" "ingress" {
  cluster_id = huaweicloud_cce_cluster.this.id
  name       = "nginx-ingress"
  version    = "1.2.6"
}

resource "huaweicloud_cce_addon" "this" {
  cluster_id    = huaweicloud_cce_cluster.this.id
  template_name = "metrics-server"
  version       = "1.1.4"
}

resource "huaweicloud_cce_addon" "ingress" {
  cluster_id    = huaweicloud_cce_cluster.this.id
  template_name = "nginx-ingress"
  version       = "1.2.6"
  values {
    basic = jsondecode(data.huaweicloud_cce_addon_template.ingress.spec).basic
    custom_json = jsonencode(merge(
      jsondecode(data.huaweicloud_cce_addon_template.ingress.spec).parameters.custom,
      {
        "config" = var.nginx_config
        "defaultBackendService" = "kube-system/cceaddon-nginx-ingress-default-backend"
        "headers"               = {}
        "service" = {
          "annotations"    = {}
          "loadBalancerIP" = var.loadbalancer_ip
        }
        "tcp" = {}
        "udp" = {}
      }
    ))
    flavor_json = jsonencode(merge(
      jsondecode(data.huaweicloud_cce_addon_template.ingress.spec).parameters.flavor1,
      {
        replicas = 1
        resources = [var.nginx_resource]
      }
      )
    )
  }
}
