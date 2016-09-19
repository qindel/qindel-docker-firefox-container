# Qvd client for IOS
# Copyright (C) 2015  theqvd.com trade mark of Qindel Formacion y Servicios SL
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM ubuntu:16.04
MAINTAINER The QVD <docker@theqvd.com>

LABEL version="1.0"
LABEL description="This is firefox container from an Ubuntu VM"

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://archive.canonical.com/ubuntu xenial partner" > /etc/apt/sources.list.d/partners.list;  echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" > /etc/apt/sources.list.d/multiverse.list;  echo "deb http://archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse" > /etc/apt/sources.list.d/backports.list;  echo "deb http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse " > /etc/apt/sources.list.d/security.list;  
RUN apt-get update; apt-get -y upgrade ; apt-get install -y sudo firefox flashplugin-installer
RUN apt-get autoremove -y;  apt-get clean
# CMD
ENV USER=firefox GROUP=firefox UIDNUM=1000 GIDNUM=1000 USERHOME=/home/firefox DISPLAY=:0
VOLUME ["/home/firefox"]
VOLUME ["/tmp/.X11-unix"]
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

