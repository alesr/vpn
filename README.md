# VPN

Use Terraform for provisioning a Digital Ocean Droplet to work as a VPN server provided by [Tinfoil](https://github.com/tinfoil/openvpn_autoconfig/blob/master/bin/openvpn.sh).

```
------------------------------------------------------------------------
VPN
------------------------------------------------------------------------
start                          start vpn server
stop                           stop vpn server
```

Note that you must add create Digital Ocean API token and set it on your .bashrc `export DIGITALOCEAN_TOKEN="Your API TOKEN"`.
