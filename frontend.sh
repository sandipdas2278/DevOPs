#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Pull and run frontend container
docker pull sandipdas4059/frontend
docker run -d -p 80:80 sandipdas4059/frontend
