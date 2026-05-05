#!/bin/bash

cd ~/CI-CD

git pull

pip3 install -r requirements.txt

pkill -f uvicorn || true

nohup python3 -m uvicorn main:app --host 0.0.0.0 --port 8000 > app.log 2>&1 &
