FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get -qq upgrade \
    && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo "Europe/Moscow" > /etc/timezone \
    && dpkg-reconfigure tzdata \
    && apt-get -y install vim wget curl net-tools less locales netcat procps gnupg dnsutils \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure locales \
    && update-locale LANG=en_US.UTF-8 \
    && echo "syntax on" >> /etc/vim/vimrc \
    && echo 'set mouse -=a' >> /root/.vimrc \
    && echo 'set mouse -=a' >> /etc/vim/vimrc \
    && echo 'search hg' >> /etc/resolv.conf \
    && echo 'nameserver 10.12.0.3' >> /etc/resolv.conf \
    && sed -i -e "s/\"syntax on/syntax on/" /etc/vim/vimrc

COPY .vimrc /root/
COPY .vimrc /etc/skel/
COPY .bashrc /root/.bashrc

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

