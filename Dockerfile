ARG VERSION=3.0.0

FROM ubuntu:22.04

LABEL An Decentralized IP Marketplace to Leave Your Limitations Behind. <www.bura.dev>

RUN apt-get update && \
    apt-get -y install sudo curl tar ca-certificates dos2unix

# Create ubuntu user with sudo privileges
RUN useradd -ms /bin/bash ubuntu && \
    usermod -aG sudo ubuntu 
# New added for disable sudo password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Fix upstart
RUN rm -rf /sbin/initctl && ln -s /sbin/initctl.distrib /sbin/initctl

# Set as default user
USER ubuntu

WORKDIR /myApp
COPY . /myApp/

RUN sudo dos2unix /myApp/gaganode_install.sh && sudo chmod +x /myApp/gaganode_install.sh
CMD /myApp/gaganode_install.sh ; sleep infinity
