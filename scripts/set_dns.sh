#!/usr/bin/env bash
set -euo pipefail

FLOATING_IP="$(./scripts/get_ip.sh)"

curl -XPOST "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE/dns_records" \
    -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
    -H "X-Auth-Key: $CLOUDFLARE_TOKEN" \
    -H "Content-Type: application/json" \
    --data '{"type": "A", "name": "'$1'", "content": "'$FLOATING_IP'"}'
