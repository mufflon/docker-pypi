FROM codekoala/saltyarch
MAINTAINER Craig Weber <crgwbr@gmail.com>

ENV PYPISERVER_VERSION='1.2.0'
RUN pacman -Sy --noconfirm --needed python-pip python-passlib && pip install -U pypiserver[cache]==$PYPISERVER_VERSION && mkdir -p /srv/pypi && rm -rf /var/cache/pacman/*

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd
COPY sshd_config /etc/ssh/
EXPOSE 2222 80

EXPOSE 8000

VOLUME ["/srv/pypi"]

ADD run.sh /
CMD ["./run.sh"]
