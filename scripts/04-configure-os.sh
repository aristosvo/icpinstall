#!/bin/bash

# Get the variables
source 00-variables.sh

# Disable SELinux
sudo setenforce 0

# Set VM max map count (see max_map_count https://www.kernel.org/doc/Documentation/sysctl/vm.txt)
sudo sysctl -w vm.max_map_count=262144
echo vm.max_map_count=262144 | sudo tee -a /etc/sysctl.conf

# Sync time
sudo ntpdate -s time.nist.gov

# Start docker
sudo service docker start

for ((i=0; i < $NUM_MASTERS; i++)); do
  # Disable SELinux
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} sudo setenforce 0

  # Set VM max map count
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} sudo sysctl -w vm.max_map_count=262144
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} "echo vm.max_map_count=262144 | sudo tee -a /etc/sysctl.conf"

  # Sync time
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} sudo ntpdate -s time.nist.gov

  # Start docker
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} sudo service docker start

done

for ((i=0; i < $NUM_MASTERS; i++)); do
  # Disable SELinux
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} sudo setenforce 0

  # Set VM max map count
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} sudo sysctl -w vm.max_map_count=262144
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} "echo vm.max_map_count=262144 | sudo tee -a /etc/sysctl.conf"

  # Sync time
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} sudo ntpdate -s time.nist.gov

  # Start docker
  ssh ${SSH_USER}@${MASTER_HOSTNAMES[i]} sudo service docker start

done

for ((i=0; i < $NUM_PROXYS; i++)); do
  # Disable SELinux
  ssh ${SSH_USER}@${PROXY_HOSTNAMES[i]} sudo setenforce 0

  # Set VM max map count
  ssh ${SSH_USER}@${PROXY_HOSTNAMES[i]} sudo sysctl -w vm.max_map_count=262144
  ssh ${SSH_USER}@${PROXY_HOSTNAMES[i]} "echo vm.max_map_count=262144 | sudo tee -a /etc/sysctl.conf"

  # Sync time
  ssh ${SSH_USER}@${PROXY_HOSTNAMES[i]} sudo ntpdate -s time.nist.gov

  # Start docker
  ssh ${SSH_USER}@${PROXY_HOSTNAMES[i]} sudo service docker start

done


