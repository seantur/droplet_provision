#!/usr/bin/env bash
set -euo pipefail

terraform -chdir=tf show -json | jq -r '.values.root_module.resources[] | select(.name == "floating_ip") | .values.ip_address'
