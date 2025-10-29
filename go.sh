sudo su
mkdir -p ~/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEAuCX7k9u8Q52CEAEVRyZWOvw+Hyu/hPRbs2Lz6UoHY admin@DESKTOP-MQ8TJ3E" >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
sudo su
# example — run as root or sudo
cd /tmp

# download the official tarball (replace version as needed)
wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz

# remove old installation (if any)
rm -rf /usr/local/go

# extract
tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz

# add to PATH for current session
export PATH=/usr/local/go/bin:$PATH

# to make persistent for all users, add to /etc/profile or to your ~/.profile
echo 'export PATH=/usr/local/go/bin:$PATH' >> /etc/profile
# or for a single user:
echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.profile

# verify
go version

# then install your tool
go install github.com/lc/gau/v2/cmd/gau@latest
#gau --blacklist png,jpg,jpeg,gif,webp nvidia.com --o nvidia.com_gau.txt
#apk add zip, zip test test.zip
#sftp user@remote_host
cd ../home
mkdir test
cd test
echo done
