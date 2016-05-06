FROM debian:jessie
MAINTAINER Benjamin Kampmann (http://github.com/ligthyear)

RUN apt-get install tmux

RUN mkdir -p /app
WORKDIR /app

COPY run.sh /app

RUN curl -sLO https://github.com/yudai/gotty/releases/download/v0.0.13/gotty_linux_386.tar.gz
RUN tar xvff gotty_linux_386.tar.gz

RUN curl -sLO https://github.com/maidsafe/safe_vault/releases/download/0.8.0/safe_vault-v0.8.0-linux-x64.zip
RUN unzip safe_vault-v0.8.0-linux-x64.zip
RUN mv safe_vault-v0.8.0-linux-x64/* .

EXPOSE 8080
CMD ./run.sh
