# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "SSH Key"
  public_key = file(var.ssh_public_key_path)
}

# Create your pier
resource "digitalocean_droplet" "planet" {
  image       = "ubuntu-18-04-x64"
  name        = var.patp
  region      = var.region
  size        = var.size
  monitoring  = true
  ssh_keys    = [digitalocean_ssh_key.default.fingerprint]

  connection {
    type        = "ssh"
    private_key = file(var.ssh_private_key_path)
    host        = digitalocean_droplet.planet.ipv4_address
  }

  provisioner "file" {
    source      = var.keyfile_path
    destination = "/tmp/keyfile.key"
  }

  provisioner "file" {
    destination = "/tmp/setup.sh"
    content = templatefile("${path.module}/setup.sh.tpl", {
      urbit_version = var.urbit_version
      patp          = var.patp
    })
  }

  provisioner "remote-exec" {
    inline = [
      "sh /tmp/setup.sh"
    ]
  }
}