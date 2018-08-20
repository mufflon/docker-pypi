FROM python:3.7-stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN pip install passlib && pip install pypiserver && mkdir -p /srv/pypi

RUN apt-get update \
    && apt-get install -y openssh-server \
    && echo "root:Docker!" | chpasswd

RUN mkdir /run/sshd

COPY sshd_config /etc/ssh/
RUN chmod a-w /etc/ssh/sshd_config
EXPOSE 2222 8000 8080

VOLUME ["/srv/pypi"]

ADD run.sh /
CMD ["./run.sh"]
