FROM almalinux:9

LABEL maintainer="sophoniebouye@gmail.com"

# Determine fastest mirrors for speed up getting packages from repo
RUN echo 'fastestmirror=True' >> /etc/dnf/dnf.conf && \
  echo 'max_parallel_downloads=7' >> /etc/dnf/dnf.conf

# Update the system
RUN dnf -y update && \
  dnf clean all

# Install EPEL
RUN  dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

RUN dnf install \
  git \
  htop \
  less \
  vim \
  openssl \
  unzip \
  wget \
  vim -y
