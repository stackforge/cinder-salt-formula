{%- from "cinder/map.jinja" import cinder with context %}

include:
  - .db
  - .keystone
  - .conf

{{ cinder.name }}:
  pkg.installed:
    - refresh: False
    - pkgs: {{ cinder.server_pkgs }}
  service.running:
    - names: {{ cinder.server_services }}
    - enable: True
    - require:
      - pkg: {{ cinder.name }}
      - file: /etc/cinder/cinder.conf
    - watch:
      - file: /etc/cinder/cinder.conf

{{ cinder.name }}_sync_db:
  cmd.run:
    - name: cinder-manage db sync
    - require:
      - file: /etc/cinder/cinder.conf
