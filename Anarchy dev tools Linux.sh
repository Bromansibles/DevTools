{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
# Update package list and upgrade existing packages\
echo "Updating system..."\
sudo apt update && sudo apt upgrade -y\
\
# Install Visual Studio Code (as Visual Studio is not available for Linux)\
echo "Installing Visual Studio Code..."\
sudo apt install -y software-properties-common apt-transport-https wget\
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -\
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"\
sudo apt update\
sudo apt install -y code\
\
# Install MySQL Workbench (as Sequel Ace is macOS-only)\
echo "Installing MySQL Workbench..."\
sudo apt install -y mysql-workbench\
\
# Install CMake\
echo "Installing CMake..."\
sudo apt install -y cmake\
\
# Install Git\
echo "Installing Git..."\
sudo apt install -y git\
\
# Install Docker\
echo "Installing Docker..."\
sudo apt install -y docker.io\
sudo systemctl start docker\
sudo systemctl enable docker\
\
# Add current user to the docker group to avoid using 'sudo' with Docker commands\
sudo usermod -aG docker $USER\
\
# Post installation steps\
echo "Starting Docker..."\
sudo systemctl start docker\
\
# Clean up unnecessary packages\
echo "Cleaning up..."\
sudo apt autoremove -y\
\
echo "Installation of development tools completed!"\
echo "You may need to log out and back in for Docker group changes to take effect."\
}