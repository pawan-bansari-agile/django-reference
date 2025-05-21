FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# COPY wait-for-db.sh /wait-for-db.sh

COPY . .
# ENTRYPOINT ["/wait-for-db.sh"]
CMD ["gunicorn", "multitenant_project.wsgi:application", "-c", "gunicorn.conf.py"]
