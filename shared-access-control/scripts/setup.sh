#!/bin/bash

# Create users
sudo useradd -m intern1

# Create shared directory
sudo mkdir -p /projects/shared

# Set ownership
sudo chown root:dev /projects/shared

# Set permissions (setgid enabled)
sudo chmod 2770 /projects/shared

# Apply ACLs
sudo setfacl -m g:hr:r-x /projects/shared
sudo setfacl -m u:auditor1:r-x /projects/shared
sudo setfacl -m u:intern1:r-x /projects/shared

# Default ACLs
sudo setfacl -d -m g:dev:rwx /projects/shared
sudo setfacl -d -m g:hr:r-x /projects/shared
sudo setfacl -d -m u:auditor1:r-x /projects/shared
sudo setfacl -d -m u:intern1:r-x /projects/shared

# Fix mask
sudo setfacl -m m:rwx /projects/shared
sudo setfacl -d -m m:rwx /projects/shared
