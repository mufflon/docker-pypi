FROM codekoala/saltyarch
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

RUN pacman -Sy --noconfirm --needed python-pip python-passlib && pip install -U pypiserver && mkdir -p /srv/pypi && rm -rf /var/cache/pacman/*

EXPOSE 8000
VOLUME ["/srv/pypi"]

CMD ["pypi-server", "-p", "8000", "-P", "/srv/pypi/.htaccess", "/srv/pypi"]
