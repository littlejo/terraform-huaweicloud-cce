output "kubeconfig" {
  value = huaweicloud_cce_cluster.this.kube_config_raw
}

output "certificate_clusters" {
  value = huaweicloud_cce_cluster.this.certificate_clusters
}

output "certificate_users" {
  value = huaweicloud_cce_cluster.this.certificate_users
}
