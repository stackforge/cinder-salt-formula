/etc/cinder/cinder.conf:
  file.managed:
    - source: salt://cinder/files/cinder.conf
    - template: jinja
