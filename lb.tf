
resource "digitalocean_loadbalancer" "main" {
  name   = var.prefix
  region = var.digitalocean_region

  droplet_tag = "k8s:${digitalocean_kubernetes_cluster.main.id}"

  healthcheck {
    port     = 80
    protocol = "tcp"
  }

  forwarding_rule {
    entry_port      = 80
    target_port     = 80
    entry_protocol  = "tcp"
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port      = 443
    target_port     = 443
    entry_protocol  = "tcp"
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port      = 8080
    target_port     = 8080
    entry_protocol  = "tcp"
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port      = 25
    target_port     = 30025
    entry_protocol  = "tcp"
    target_protocol = "tcp"
  }
}
