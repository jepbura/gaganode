FROM ubuntu:22.04

LABEL An Decentralized IP Marketplace to Leave Your Limitations Behind. <www.bura.dev>

RUN apt-get update && \
    apt-get -y install curl tar ca-certificates dos2unix sudo

# Create ubuntu user with sudo privileges
RUN useradd -ms /bin/bash ubuntu && \
    usermod -aG sudo ubuntu 
# New added for disable sudo password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Fix upstart
RUN rm -rf /sbin/initctl && ln -s /sbin/initctl.distrib /sbin/initctl

WORKDIR /myApp
COPY . /myApp/

USER root
RUN dos2unix /myApp/gaganode_install.sh && chmod +x /myApp/gaganode_install.sh
USER ubuntu

CMD /myApp/gaganode_install.sh ; sleep infinity
