provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  #
}

resource "digitalocean_droplet" "vpn" {
  ssh_keys           = [7559088]
  image              = "${var.ubuntu}"
  region             = "${var.do_lon1}"
  size               = "512mb"
  private_networking = false
  backups            = false
  ipv6               = false
  name               = "vpn"

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "apt-get update",
      "apt-get -y install git",
      "git clone https://github.com/tinfoil/openvpn_autoconfig.git",
      "chmod +x openvpn_autoconfig/bin/openvpn.sh",
      "ls",
      "bash openvpn_autoconfig/bin/openvpn.sh",
    ]

    connection {
      type     = "ssh"
      private_key = "${file("~/.ssh/id_rsa")}"
      user     = "root"
      timeout  = "2m"
    }
  }

  provisioner "local-exec" {
    command = "scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@'${digitalocean_droplet.vpn.ipv4_address}':/etc/openvpn/client.ovpn vpn.ovpn"
  }
}
