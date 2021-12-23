variable "name" {
}

variable "name_node_pool" {
  default = "generic"
}

variable "vpc_id" {
}

variable "subnet_id" {
}

variable "flavor" {
  default = "s3.large.4"
}

variable "cluster_flavor" {
  default = "cce.s2.small"
}

variable "public_key_name" {
}

variable "loadbalancer_ip" {
  type    = string
  default = ""
}

variable "nginx_config" {
  type    = map(any)
  default = {}
}

variable "nginx_resources" {
  type    = map(any)
  default = {
              limitsCpu   = "1024m"
              limitsMem   = "1024Mi"
              name        = "nginx-ingress"
              requestsCpu = "256m"
              requestsMem = "256Mi"
            }
}
