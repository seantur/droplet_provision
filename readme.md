# Purpose
This repo is for provisioning a digital ocean droplet with terraform and ansible. The ansible playbook is **not idempotent** because it removes root ssh access.

An example script which uses the cloudflare API to set the DNS A record for the floating IP is also included.

## Host Requirements:
* `ansible`
* `curl`
* `jq`
* `terraform`


## Prerequisites
* Export `DIGITALOCEAN_TOKEN` (see api token [here](https://cloud.digitalocean.com/account/api/tokens))
* Update ssh_id in `tf/terraform.tfvars` (use api to get ssh_id [here](https://docs.digitalocean.com/reference/api/api-reference/#operation/list_all_keys))
* Export cloudflare environment variables if needed:
    * `CLOUDFLARE_TOKEN` (see [here](https://dash.cloudflare.com/profile/api-tokens))
    * `CLOUDFLARE_EMAIL`
    * `CLOUDFLARE_ZONE` (Zone ID)

# Usage

* `./run.sh`
* `./set_dns subdomain.domain.com`
