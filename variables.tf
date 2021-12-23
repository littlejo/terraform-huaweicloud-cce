variable "name" {
  description = "Name of the cce cluster"
}

variable "flavor_id" {
  description = "Flavor of the cce cluster"
  default     = "cce.s2.small"
}

variable "vpc_id" {
  description = "Id of the vpc"
}

variable "subnet_id" {
  description = "Id of the subnet"
}

variable "node_pool_name" {
  description = "Name of the cce node pool"
  default     = "generic"
}

variable "node_pool_flavor_id" {
  description = "Flavor of the cce node pool"
  default     = "s3.large.4"
}

variable "node_pool_key_pair" {
  description = "public ssh key of cce node pool"
}

variable "addon_ingress_loadbalancer_ip" {
  description = "Load balancer ip for nginx-ingress addon"
  type        = string
  default     = ""
}

variable "addon_ingress_config" {
  description = "nginx config for nginx-ingress addon"
  type        = map(any)
  default     = {}
}

variable "addon_ingress_resource" {
  description = "nginx resource for nginx-ingress addon"
  type        = map(any)
  default = {
    limitsCpu   = "1024m"
    limitsMem   = "1024Mi"
    name        = "nginx-ingress"
    requestsCpu = "256m"
    requestsMem = "256Mi"
  }
}
