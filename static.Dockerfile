ARG VERSION=1.25.4
FROM nginx:${VERSION}

WORKDIR /usr/share/nginx/html

COPY src/django-community-board/static/. /usr/share/nginx/html/static/.
COPY conf/web/nginx/. /etc/nginx/

# SSL 관련 패키지를 설치합니다.
# RUN apt-get update && apt-get install -y openssl

# SSL 인증서와 키를 생성합니다.
# RUN mkdir -p /etc/nginx/certs && \
#     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/nginx/certs/server.key \
#     -out /etc/nginx/certs/server.crt \
#     -subj "/C=KR/ST=SEOUL/L=Kangnam/O=SongCompany/OU=IT/CN=song-domain.com"
# RUN mkdir -p /etc/nginx/certs && chmod -R 755 /etc/nginx/certs
# COPY certs/. /etc/nginx/certs/
EXPOSE 80/tcp

# FROM nginx:latest

# # 작업 디렉토리 설정
# WORKDIR /usr/share/nginx/html

# # static_web/room 폴더의 파일들을 현재 작업 디렉토리로 복사
# # COPY room-homepage-master/ .

# # 컨테이너가 실행될 때 Nginx 시작
# CMD ["nginx", "-g", "daemon off;"]