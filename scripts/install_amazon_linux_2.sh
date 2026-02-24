#!/usr/bin/env bash
set -euo pipefail

echo "[+] Updating packages..."
sudo yum update -y

echo "[+] Installing CloudWatch Agent..."
sudo yum install -y amazon-cloudwatch-agent

echo "[+] Done."
echo "Next: copy config to /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json"
