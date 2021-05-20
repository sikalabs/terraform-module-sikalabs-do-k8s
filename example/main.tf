locals {
  sikademo_com_zone_id = "f2c00168a7ecd694bb1ba017b332c019"
}

module "example" {
  source              = "../."
  prefix              = "module-example"
  cloudflare_zone_id  = local.sikademo_com_zone_id
  digitalocean_region = "fra1"
  kubernetes_version  = "1.20.2-do.0"
  node_size           = "s-2vcpu-4gb"
  node_count          = 1
}

output "kubeconfig" {
  value     = module.example.kubeconfig
  sensitive = true
}
