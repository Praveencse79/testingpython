FROM python:3.9-slim-buster
RUN apt update && apt install -y python3-pip

RUN apt update -y && apt install awscli -y
WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt

CMD ["python3", "app.py"]
