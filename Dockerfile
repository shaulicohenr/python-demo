FROM python:3.10-slim
WORKDIR /app
COPY requirements.txt .
COPY app.py .
CMD ["python", "app.py"]
