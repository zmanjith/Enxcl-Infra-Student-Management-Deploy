#!/bin/bash

sudo apt update -y

sudo apt install docker.io -y

sudo systemctl enable docker

sudo systemctl start docker

sudo usermod -aG docker ec2-user