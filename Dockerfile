FROM ubuntu:14.04

# blame this guy
MAINTAINER Bryan Bishop <kanzure@gmail.com>

# environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV LANG C.UTF-8
ENV LC_ALL C

# disable dpkg fsync to make zoom fast
ADD ./container/etc/dpkg/dpkg.cfg.d/02apt-speedup /etc/dpkg/dpkg.cfg.d/02apt-speedup

# because bitcoin package metadata
ADD ./container/etc/apt/sources.list.d/bitcoin.list /etc/apt/sources.list.d/bitcoin.list

# learn about some bitcoin signatures
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8842ce5e

# update package metadata
RUN apt-get update -y

# store system-level package requirements in /tmp
ADD ./requirements-docker.apt /tmp/requirements-docker.apt

# Install whatever packages are required to run this thing. Filter out lines
# beginning with "#" because they are comments.
RUN apt-get install -y $(cat /tmp/requirements-docker.apt | grep -v "^#")
