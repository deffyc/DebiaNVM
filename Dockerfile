# DebiaNVM
FROM debian:jessie
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update && apt install -y sudo curl wget vim

ARG c9port=80
ARG user=c9
ARG pass=rules
ARG workspace="/home/c9/workspace"

ENV c9port $c9port
ENV user $user
ENV pass $pass
ENV workspace $workspace

RUN useradd --create-home --no-log-init --shell /bin/bash $user
RUN adduser $user sudo
RUN echo "$user:$pass" | chpasswd
USER $user
WORKDIR /home/$user

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.6/install.sh | bash
