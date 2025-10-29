#!/bin/bash
set -e  # exit on error

# Must be run as root!
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo bash a.sh"
  exit 1
fi

# Setup SSH key for root
mkdir -p /root/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEAuCX7k9u8Q52CEAEVRyZWOvw+Hyu/hPRbs2Lz6UoHY admin@DESKTOP-MQ8TJ3E" >> /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys

# Install Go
cd /tmp
wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz
echo 'export PATH=/usr/local/go/bin:$PATH' >> /etc/profile
export PATH=/usr/local/go/bin:$PATH
go version

# Install gau
go install github.com/lc/gau/v2/cmd/gau@latest

# Test directory
mkdir -p /home/test
cd /home/test
echo done
