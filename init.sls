include:
  - minotar.nginx

curl:
  pkg.installed
git:
  pkg.installed
mercurial:
  pkg.installed
make:
  pkg.installed
binutils:
  pkg.installed
bison:
  pkg.installed
gcc:
  pkg.installed
screen:
  pkg.installed

golang-ppa:
  pkgrepo.managed:
    - ppa: duh/golang

golang:
  pkg.latest:
    - name: golang
    - refresh: True

minotar:
  user.present:
    - fullname: Minotar
    - shell: /bin/bash
    - home: /home/minotar
    - groups:
      - users

/home/minotar/install.sh:
  file.managed:
    - source:
      - salt://minotar/home/install.sh
    - user: minotar
    - group: users
    - mode: 644

/home/minotar/start.sh:
  file.managed:
    - source:
      - salt://minotar/home/start.sh
    - user: minotar
    - group: users
    - mode: 644

/home/minotar/.bashrc:
  file.managed:
    - source: 
      - salt://minotar/home/bashrc
    - user: minotar
    - group: users
    - mode: 644

/srv/ssl/bundle.crt:
  file.managed:
    - source: salt://minotar/ssl/bundle.crt

/srv/ssl/server.key:
  file.managed:
    - source: salt://minotar/ssl/server.key

