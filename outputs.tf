output "kubeconfig" {
  description = "kubeconfig file of cce cluster"
  value       = huaweicloud_cce_cluster.this.kube_config_raw
}

output "certificate_clusters" {
  description = "certificate of cce cluster"
  value       = huaweicloud_cce_cluster.this.certificate_clusters
}

output "certificate_users" {
  description = "certificate users of cce cluster"
  value       = huaweicloud_cce_cluster.this.certificate_users
}
