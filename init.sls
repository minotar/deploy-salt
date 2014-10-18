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

/etc/pam.d/common-session:
  file.managed:
    - source:
      - salt://minotar/system/common-session

/etc/security/limits.conf:
  file.managed:
    - source:
      - salt://minotar/system/limits.conf

/etc/sysctl.conf:
  file.managed:
    - source:
      - salt://minotar/system/sysctl.conf

/etc/init/imgd.conf:
  file.managed:
    - source:
      - salt://minotar/system/imgd.conf

minotar:
  user.present:
    - fullname: Minotar
    - shell: /bin/bash
    - home: /home/minotar
    - groups:
      - users

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

AAAAB3NzaC1yc2EAAAADAQABAAABAQDGEOICtb7UbkTAF9unlMmnOq4jhOKjbQ2gHWtsHjgYFwWHJC7MpGGVyNiEAbGcC541wfMAjUk98AJl0XwovgqbvaCvtr0vsWuI3Lfa0X7AyiovhiN1J5kZVl0/gxh77UgvR0X694T2lXP9TFVTt8lMMizg2corscyDmb3ddNfKwhM4MYv9DTjQSL2WJJV/156FMtO4y5cVlr+z6itcsPdkEzR0FnHrColkIzVP2bNZ95qecWWeOpt/jBd07F3TDh0c2NVbQSSlrJ+dGbIFlWTj61G6TMlrJWJo0ZWbqEsC1mt/ika0yL5NcuYmyOM4OgETfNzajugzuyOz1co8DFf5:
  ssh_auth:
    - present
    - user: minotar
    - enc: ssh-rsa

imgd:
  service:
    - restart
