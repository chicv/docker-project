#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:16.04

RUN useradd vcg -p vcg -s /bin/bash \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y build-essential \
    && apt-get install -y software-properties-common \
    && apt-get install -y aptitude \
    && aptitude install sudo \
    && echo 'vcg ALL=(ALL)  NOPASSWD:ALL' >> /etc/sudoers


ENV LANG=C.UTF-8
ARG DEBIAN_FRONTED=noninteractive

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
  && apt-get install -y byobu curl git htop man unzip vim wget \
  && apt-get install -y bash-completion \
  #&& apt-get install -y --no-install-recommends apt-utils \
  && apt-get install -y software-properties-common python-software-properties \
  && apt-get install -y apt-transport-https \
  #&& apt-get install -y net-tools \
  && rm -rf /var/lib/apt/lists/*

# Make WorkSpace
RUN \
  mkdir /home/vcg/.ssh -p \
  && chown vcg:vcg /home/vcg -R

COPY id_rsa /home/vcg/.ssh/id_rsa
COPY id_rsa.pub /home/vcg/.ssh/id_rsa.pub





USER vcg 
WORKDIR /home/vcg
RUN echo 'thanks for building'