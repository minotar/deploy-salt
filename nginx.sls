nginx:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://minotar/nginx.conf
    - mode: 644
    - user: root
    - group: root

