
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
      - salt://imgd/system/common-session

/etc/security/limits.conf:
  file.managed:
    - source:
      - salt://imgd/system/limits.conf

/etc/sysctl.conf:
  file.managed:
    - source:
      - salt://imgd/system/sysctl.conf

/etc/init/imgd.conf:
  file.managed:
    - source:
      - salt://imgd/system/imgd.conf

minotar:
  user.present:
    - fullname: Minotar
    - shell: /bin/bash
    - home: /home/minotar
    - groups:
      - users

/home/minotar/.bashrc:
  file.managed:
    - source: salt://imgd/home/bashrc
    - user: minotar
    - group: users

/home/minotar/imgd:
  file.managed:
    - source: salt://imgd/deploy/imgd
    - user: minotar
    - group: users
    - mode: 744

imgd:
  service:
    - restart
