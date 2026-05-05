#!/bin/bash

cd ~/CI-CD

git fetch origin
git reset --hard origin/main

pip3 install -r requirements.txt

pkill -f uvicorn || true

sudo systemctl restart cicd