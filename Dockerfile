FROM codekoala/saltyarch
MAINTAINER Craig Weber <crgwbr@gmail.com>

ENV PYPISERVER_VERSION='1.2.0'
RUN pacman -Sy --noconfirm --needed python-pip python-passlib && pip install -U pypiserver[cache]==$PYPISERVER_VERSION && mkdir -p /srv/pypi && rm -rf /var/cache/pacman/*

EXPOSE 8000
EXPOSE 2222 80
VOLUME ["/srv/pypi"]

ADD run.sh /
CMD ["./run.sh"]
