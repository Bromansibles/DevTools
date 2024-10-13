#!/bin/bash

# Update package list and upgrade existing packages
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install Visual Studio Code (as Visual Studio is not available for Linux)
echo "Installing Visual Studio Code..."
sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# Install Beekeeper Studio (Database Editor)
echo "Installing Beekeeper Studio..."
wget -O beekeeper-studio.deb https://docs.beekeeperstudio.io/installation/linux/#apt-deb
sudo apt install -y ./beekeeper-studio.deb
rm beekeeper-studio.deb

# Install CMake
echo "Installing CMake..."
sudo apt install -y cmake

# Install Git
echo "Installing Git..."
sudo apt install -y git

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to the docker group to avoid using 'sudo' with Docker commands
sudo usermod -aG docker $USER

# Post installation steps
echo "Starting Docker..."
sudo systemctl start docker

# Clean up unnecessary packages
echo "Cleaning up..."
sudo apt autoremove -y

echo "Installation of development tools completed!"
echo "You may need to log out and back in for Docker group changes to take effect."
