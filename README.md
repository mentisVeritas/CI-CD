# 🚀 CI/CD Demo (FastAPI + AWS EC2)

Минимальный проект, демонстрирующий полный цикл CI/CD:
GitHub → GitHub Actions → SSH → AWS EC2 → авто-деплой.

---

## 📌 Стек

- Python + FastAPI  
- Uvicorn  
- AWS EC2 (Ubuntu)  
- GitHub Actions (CI/CD)  

---

## ⚙️ Как это работает

1. Ты делаешь git push в ветку main
2. Запускается GitHub Actions pipeline
3. Pipeline подключается к EC2 по SSH
4. Выполняется deploy.sh
5. Сервер перезапускается
6. Сайт обновляется автоматически

---

## 🧱 Архитектура

- Compute: AWS EC2  
- Network: Security Group (порт 8000 открыт)  
- CI/CD: GitHub Actions  
- Access: SSH ключ (IAM доступ)  

---

## 📁 Структура проекта
```
CI-CD/ 
├── main.py 
├── index.html 
├── requirements.txt 
├── deploy.sh 
└── .github/workflows/deploy.yml
```

---

## ▶️ Локальный запуск

bash python3 -m venv .venv source .venv/bin/activate pip install -r requirements.txt  uvicorn main:app --reload 

Открыть:
http://127.0.0.1:8000

---

## ☁️ Деплой на AWS EC2

На сервере:

bash git clone https://github.com/mentisVeritas/CI-CD.git cd CI-CD pip3 install -r requirements.txt  python3 -m uvicorn main:app --host 0.0.0.0 --port 8000 

---

## 🔁 deploy.sh

bash #!/bin/bash  cd ~/CI-CD  git pull  pip3 install -r requirements.txt  pkill -f uvicorn || true  nohup python3 -m uvicorn main:app --host 0.0.0.0 --port 8000 > app.log 2>&1 & 

---

## ⚡ GitHub Actions (CI/CD)

Файл:
.github/workflows/deploy.yml

Pipeline:
- Checkout кода  
- Подключение к EC2  
- Выполнение deploy.sh  

---

## 🔐 Secrets

В GitHub:

SSH_KEY = содержимое cicd-key.pem

---

## 🧪 Как протестировать CI/CD

1. Измени index.html (например версию)
2. Сделай:

bash git add . git commit -m "test deploy" git push 

3. Открой:
Live demo: http://<EC2_HOST>:8000
(EC2_HOST задаётся в GitHub Variables)

→ сайт обновится автоматически

---

## 🎯 Что демонстрирует проект

- Реальный CI/CD pipeline  
- Авто-деплой без ручного вмешательства  
- Связку GitHub → AWS  
- Базовую cloud архитектуру  

---

## 📎 Примечание

Это демо-проект. В production лучше использовать:
- Docker  
- systemd / supervisor  
- HTTPS + domain  
- AWS CodePipeline / ECS  
