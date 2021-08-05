#!/usr/bin/env bash
set -euo pipefail

curl -XGET -H "Content-Type:application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/account/keys" | jq
