terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "random_pet" "server" { }

resource "digitalocean_droplet" "droplet" {
  name = "${random_pet.server.id}"
  image = "ubuntu-20-04-x64"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = [var.ssh_id]

  # The remote-exec blocks until ssh connection is established
  provisioner "remote-exec" {
    inline = ["echo Done!"]

    connection {
      host = self.ipv4_address
      type = "ssh"
      user = "root"
      private_key = file(var.pvt_key)
    }
  }
}

resource "digitalocean_floating_ip" "floating_ip" {
  droplet_id = digitalocean_droplet.droplet.id
  region = digitalocean_droplet.droplet.region
}
