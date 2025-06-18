resource "azurerm_linux_virtual_machine" "dev-ubuntu-vm" {
  name                  = "dev-ubuntu-vm"
  resource_group_name   = azurerm_resource_group.dev-resource-group.name
  location              = azurerm_resource_group.dev-resource-group.location
  size                  = "Standard_B1s"
  admin_username        = "learning"
  network_interface_ids = [azurerm_network_interface.dev-nic.id]

  disable_password_authentication = false
  admin_password                  = "Redhat@12345"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  # Cloud-init script to install Apache and show Hello World
  custom_data = base64encode(<<EOF
#!/bin/bash

set -e  # Exit on any error

# Optional: log output for debugging
exec > /var/log/custom-data.log 2>&1

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io

systemctl start docker
systemctl enable docker

# Add 'learning' user to docker group if user exists; else, create user
if id "learning" &>/dev/null; then
    usermod -aG docker learning
else
    # Create the user with no password and add to docker group
    useradd -m -s /bin/bash learning
    usermod -aG docker learning
fi

EOF
  )
}
