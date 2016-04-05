FROM codekoala/saltyarch
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

RUN pacman -Sy --noconfirm --needed python-pip python-passlib && pip install -U pypiserver && mkdir -p /srv/pypi && rm -rf /var/cache/pacman/*

EXPOSE 8000
VOLUME ["/srv/pypi"]

ADD run.sh /
CMD ["./run.sh"]
