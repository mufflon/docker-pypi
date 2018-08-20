#!/usr/bin/env bash

echo "starting sshd"

service ssh start

echo "sshd started"

echo "starting pypi"

touch /srv/pypi/.htaccess
pypi-server -p 8000 -P /srv/pypi/.htaccess -a update,download,list /srv/pypi

echo "pyp started"