ARG VERSION=3.10-slim
FROM python:${VERSION}
WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get -y install python3-dev default-libmysqlclient-dev \
                        build-essential pkg-config

RUN pip install mysqlclient
RUN pip install pymysql

COPY src/django-community-board/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY src/django-community-board/. .
RUN python manage.py makemigrations

COPY was_run.sh ./
RUN chmod +x ./was_run.sh

# RUN mkdir -p /etc/nginx/certs && chmod -R 755 /etc/nginx/certs
# # COPY nginx.crt /etc/nginx/certs/server.crt
# # COPY nginx.key /etc/nginx/certs/server.key
# COPY certs/. /etc/nginx/certs/

CMD ["/bin/bash", "-c", "./was_run.sh"]