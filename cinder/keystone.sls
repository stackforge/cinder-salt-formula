keystone_cinder_user:
  keystone.user_present:
    - name: cinder
    - password: {{ salt['pillar.get']('cinder:keystone:password') }}
    - email: {{ salt['pillar.get']('cinder:keystone:email', 'cinder@nolocal.com')}}
    - tenant: service
    - enable: True
    - roles: 
      - service:
        - admin

keystone_cinder_service:
  keystone.service_present:
    - name: cinder
    - service_type: volume
    - description: Openstack Volume Service

keystone_cinder_endpoint:
  keystone.endpoint_present:
    - name: cinder
    - publicurl: http://{{ salt["pillar.get"]("cinder:public_ip") }}:8776/v1/%(tenant_id)s
    - internalurl: http://{{ salt["pillar.get"]("cinder:internal_ip") }}:8776/v1/%(tenant_id)s
    - adminurl: http://{{ salt["pillar.get"]("cinder:admin_ip") }}:8776/v1/%(tenant_id)s
