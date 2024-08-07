#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Pull and run backend container
docker pull sandipdas4059/backend
docker run -d -p 3306:3306 sandipdas4059/backend
