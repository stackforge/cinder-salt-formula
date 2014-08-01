{%- from "cinder/map.jinja" import cinder with context %}

include:
  - .conf

cinder-volume:
  pkg.installed:
    - refresh: False
    - name: {{ cinder.cinder_volume }}
    - require_in:
      - file: /etc/cinder/cinder.conf
  service.running:
    - name: {{ cinder.cinder_volume_service }}
    - enable: True
    - restart: True
    - require:
      - pkg: cinder-volume
      - file: /etc/cinder/cinder.conf
    - watch:
      - file: /etc/cinder/cinder.conf
