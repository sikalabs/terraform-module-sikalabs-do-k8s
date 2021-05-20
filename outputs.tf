
output "lb_ip" {
  value = digitalocean_loadbalancer.main.ip
}

output "kubeconfig" {
  value     = digitalocean_kubernetes_cluster.main.kube_config.0.raw_config
  sensitive = true
}
