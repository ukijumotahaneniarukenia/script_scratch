FROM ubuntu:18.04

ARG OS_VERSION
ARG REPO

ARG GIT_VERSION
ARG PYTHON_VERSION

ENV LANG=ja_JP.UTF-8
ENV DISPLAY=:0.0
ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list && \
apt update && \
apt upgrade -y

RUN apt install -y git
RUN cd /usr/local/src && git clone https://github.com/ukijumotahaneniarukenia/$REPO.git

RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-docker-host-user.sh

USER root

RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-repository-pkg.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-dev-pkg.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-tool-pkg.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-network-pkg.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-vim-system.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-vim-user.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-vim_plug.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-python-$PYTHON_VERSION.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-pre-patch-git-$GIT_VERSION.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-git-$GIT_VERSION.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-config-dotfile.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-config-locale.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-config-env.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-config-ld.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-config-font-RictyDiminished.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-fcitx_mozc.sh

RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-default-user.sh 1000 aine 1000 aine aine_pwd

USER aine
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-vim-user.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-install-vim_plug.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-config-dotfile.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-config-env.sh
RUN cd /usr/local/src/$REPO && bash $OS_VERSION-config-font-RictyDiminished.sh

WORKDIR /home/aine

COPY env-run.sh /etc/init/env-run.sh
ENTRYPOINT ["/etc/init/env-run.sh","ubuntu"]

