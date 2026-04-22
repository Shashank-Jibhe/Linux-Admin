#!/bin/bash

# Create users
sudo useradd -m dev1
sudo useradd -m dev2
sudo useradd -m hr1
sudo useradd -m auditor1

# Create groups
sudo groupadd dev
sudo groupadd hr
sudo groupadd audit

# Assign users to groups
sudo usermod -aG dev dev1
sudo usermod -aG dev dev2
sudo usermod -aG hr hr1
sudo usermod -aG audit auditor1

# Create directories
sudo mkdir -p /projects/dev
sudo mkdir -p /projects/hr

# Set group ownership
sudo chown :dev /projects/dev
sudo chown :hr /projects/hr

# Set permissions
sudo chmod 770 /projects/dev
sudo chmod 770 /projects/hr

# Enable setgid
sudo chmod g+s /projects/dev
sudo chmod g+s /projects/hr

# ACL for auditor
sudo setfacl -m u:auditor1:rx /projects/dev
sudo setfacl -m u:auditor1:rx /projects/hr

# Default ACL
sudo setfacl -d -m u:auditor1:rx /projects/dev
sudo setfacl -d -m u:auditor1:rx /projects/hr
