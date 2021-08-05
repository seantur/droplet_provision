#!/usr/bin/env bash
set -euo pipefail

terraform -chdir=tf apply
ansible-playbook -i $(./get_ip.sh), ansible/provision.yaml
