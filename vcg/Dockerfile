#
#  docker pull registry.docker-cn.com/library/ubuntu:16.04
#

# Pull base image.
FROM ubuntu:16.04

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN useradd vcg -p vcg -s /bin/bash

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install.

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y upgrade \
    && apt-get install -y dialog \
    && apt-get install -y build-essential \
    && apt-get install -y software-properties-common \
    && apt-get install -y aptitude \
    && aptitude install sudo \
    && echo 'vcg ALL=(ALL)  NOPASSWD:ALL' >> /etc/sudoers

RUN \
  apt-get install -y byobu curl git htop man unzip vim wget \
  && apt-get install -y bash-completion \
  && apt-get install -y software-properties-common python-software-properties

# Make WorkSpace
RUN \
  mkdir -p /home/vcg/.ssh/  \
  && chown vcg:vcg /home/vcg -R

COPY id_rsa /home/vcg/.ssh/id_rsa
COPY id_rsa.pub /home/vcg/.ssh/id_rsa.pub

ENV DEBIAN_FRONTEND teletype

USER vcg 
WORKDIR /home/vcg
RUN echo 'thanks for building'