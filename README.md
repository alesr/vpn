# VPN

Use Terraform for provisioning a Digital Ocean Droplet to work as a VPN server provided by [Tinfoil](https://github.com/tinfoil/openvpn_autoconfig/blob/master/bin/openvpn.sh).

```
------------------------------------------------------------------------
VPN
------------------------------------------------------------------------
start                          start vpn server
stop                           stop vpn server
```

Note that you must add create Digital Ocean API token and set it on your .bashrc `export DIGITALOCEAN_TOKEN="Your API TOKEN"`
You will also need the API token to retrieve you SSH key ID and past it in the Terraform main file.

```
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer [API token here]" "https://api.digitalocean.com/v2/account/keys"
```

With the ID key in hand, place it on `main.tf`:

```
resource "digitalocean_droplet" "vpn" {
  ssh_keys           = [012345]
```
