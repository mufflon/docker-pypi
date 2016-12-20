FROM codekoala/saltyarch
MAINTAINER Craig Weber <crgwbr@gmail.com>

ENV PYPISERVER_VERSION='1.1.10'
RUN pacman -Sy --noconfirm --needed python-pip python-passlib && pip install -U pypiserver==$PYPISERVER_VERSION && mkdir -p /srv/pypi && rm -rf /var/cache/pacman/*

EXPOSE 8000
VOLUME ["/srv/pypi"]

ADD run.sh /
CMD ["./run.sh"]
