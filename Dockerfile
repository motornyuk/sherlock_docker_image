# 'Version: 20210828.05'

FROM python:3.8-alpine
RUN apk add --no-cache \
    g++ \
    gcc \
    git \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    linux-headers

WORKDIR /opt
RUN git clone "https://github.com/sherlock-project/sherlock.git"

RUN pip3 install -r /opt/sherlock/requirements.txt \
  && rm -rf /root/.cache/pip/*

WORKDIR /opt/sherlock/sherlock
ENTRYPOINT ["python", "sherlock.py"]
