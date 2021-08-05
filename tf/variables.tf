variable "ssh_id" {
  type = string
  description = "ssh id from existing key, get from DO api"
}

variable "pvt_key" {
  default = "~/.ssh/id_rsa"
}
