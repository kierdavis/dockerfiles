FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y build-essential cmake libboost-dev curl git sudo tar wget

RUN mkdir -p /opt/noxim && \
    cd /opt/noxim && \
    curl https://raw.githubusercontent.com/davidepatti/noxim/master/other/setup/ubuntu.sh | sed 's/^make$/make -j$(nproc)/;s/linux-headers-$(uname -r)//;1iset -o errexit -o pipefail' | bash

ENTRYPOINT ["/opt/noxim/noxim/bin/noxim"]
