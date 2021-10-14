resource "digitalocean_kubernetes_cluster" "main" {
  name   = var.prefix
  region = var.digitalocean_region
  // Get available versions using: doctl kubernetes options versions
  version  = var.kubernetes_version
  vpc_uuid = var.vpc_uuid

  node_pool {
    name = var.prefix
    // Get available sizes using: doctl kubernetes options sizes
    size       = var.node_size
    node_count = var.node_count
  }
}
