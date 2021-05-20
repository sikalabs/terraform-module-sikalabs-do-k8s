resource "cloudflare_record" "main" {
  zone_id = var.cloudflare_zone_id
  name    = "${var.prefix}.k8s"
  value   = digitalocean_loadbalancer.main.ip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "wildcard" {
  zone_id = var.cloudflare_zone_id
  name    = "*.${cloudflare_record.main.name}"
  value   = cloudflare_record.main.hostname
  type    = "CNAME"
  proxied = false
}
