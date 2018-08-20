FROM python:3.7-stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN pip install passlib && pip install pypiserver && mkdir -p /srv/pypi

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd
COPY sshd_config /etc/ssh/
EXPOSE 2222 8080

EXPOSE 8000

VOLUME ["/srv/pypi"]

ADD run.sh /
CMD ["./run.sh"]
