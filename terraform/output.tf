output "Public ip" {
  value = "${digitalocean_droplet.vpn.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.vpn.name}"
}

output "Hour Price" {
  value = "${digitalocean_droplet.vpn.price_hourly}"
}

output "Montly Price" {
  value = "${digitalocean_droplet.vpn.price_monthly}"
}
