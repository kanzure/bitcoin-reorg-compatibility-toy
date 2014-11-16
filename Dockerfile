FROM ubuntu:14.04

# because bitcoin package metadata
ADD ./container/etc/apt/sources.list.d/bitcoin.list /etc/apt/sources.list.d/bitcoin.list

# learn about some bitcoin signatures
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8842ce5e

# update package metadata
RUN apt-get update -y

# store system-level package requirements in /tmp
ADD ./requirements.apt /tmp/requirements.apt

# Install whatever packages are required to run this thing. Filter out lines
# beginning with "#" because they are comments.
RUN apt-get install -y $(cat /tmp/requirements.apt | grep -v "^#")
