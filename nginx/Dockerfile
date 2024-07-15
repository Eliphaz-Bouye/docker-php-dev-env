FROM sophodevops/base:latest

ARG HOST_USER

RUN dnf -y update \
  dnf -y install nginx
  dnf clean all

# Create the cache directory for nginx, which the load reduces when a lot of large files are downloaded at once. 
RUN mkdir /usr/share/nginx/cache \
  chown $HOST_USER:$HOST_USER /usr/share/nginx/cache
