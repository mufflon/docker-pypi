#!/usr/bin/env bash

service ssh start

touch /srv/pypi/.htaccess
pypi-server -p 8000 -P /srv/pypi/.htaccess -a update,download,list /srv/pypi
