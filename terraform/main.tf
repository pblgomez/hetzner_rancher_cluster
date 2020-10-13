variable "hetzner_token" {}
provider "hcloud" {
  token = var.hetzner_token
}

variable "hetznerdns_token" {}
provider "hetznerdns" {
  apitoken = var.hetznerdns_token
}

variable "rancher_ip" {}

variable "domain" {}
data "hetznerdns_zone" "dns_zone" {
    name = var.domain
}

data "hcloud_server" "rancher" {
    name = "rancher"
}

resource "hetznerdns_record" "rancher" {
    zone_id = data.hetznerdns_zone.dns_zone.id
    name = "rancher"
    value = var.rancher_ip
    type = "A"
    ttl = 86400
}