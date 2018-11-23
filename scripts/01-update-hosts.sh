#!/bin/bash
# Constructs hosts file

# Get the variables
source 00-variables.sh

for ((i=0; i < $NUM_MASTERS; i++)); do
  # Remove old instance of host
  ssh-keygen -R ${MASTER_HOSTNAMES[i]}
  ssh-keygen -R ${MASTER_IPS[i]}
  # Do not ask to verify fingerprint of server on ssh
  ssh-keyscan -H ${MASTER_HOSTNAMES[i]} >> ~/.ssh/known_hosts
  ssh-keyscan -H ${MASTER_IPS[i]} >> ~/.ssh/known_hosts 
done

for ((i=0; i < $NUM_WORKERS; i++)); do
  # Remove old instance of host
  ssh-keygen -R ${WORKER_HOSTNAMES[i]}
  ssh-keygen -R ${WORKER_IPS[i]}
  # Do not ask to verify fingerprint of server on ssh
  ssh-keyscan -H ${WORKER_HOSTNAMES[i]} >> ~/.ssh/known_hosts
  ssh-keyscan -H ${WORKER_IPS[i]} >> ~/.ssh/known_hosts 
done

for ((i=0; i < $NUM_PROXYS; i++)); do
  # Remove old instance of host
  ssh-keygen -R ${PROXY_HOSTNAMES[i]}
  ssh-keygen -R ${PROXY_IPS[i]}
  # Do not ask to verify fingerprint of server on ssh
  ssh-keyscan -H ${PROXY_IPS[i]} >> ~/.ssh/known_hosts 
  ssh-keyscan -H ${PROXY_HOSTNAMES[i]} >> ~/.ssh/known_hosts
done
