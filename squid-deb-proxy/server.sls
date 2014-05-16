{% from 'squid-deb-proxy/map.jinja' import squid_deb_proxy with context %}
{% set service = {True: 'running', False: 'dead'} %}

squid-deb-proxy:
  pkg.installed

allowed_networks_src_acl:
  file.managed:
    - name: {{ squid_deb_proxy.lookup.allowed_networks_src_acl }}
    - source: salt://squid-deb-proxy/files/allowed-networks-src.acl.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      config: {{ squid_deb_proxy.server.allowed_networks_src_acl }}
    - watch_in:
      - service: squid-deb-proxy_service

mirror_dstdomain_acl:
  file.managed:
    - name: {{ squid_deb_proxy.lookup.mirror_dstdomain_acl }}
    - source: salt://squid-deb-proxy/files/mirror-dstdomain.acl.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      config: {{ squid_deb_proxy.server.mirror_dstdomain_acl }}
    - watch_in:
      - service: squid-deb-proxy_service

pkg_blacklist:
  file.managed:
    - name: {{ squid_deb_proxy.lookup.pkg_blacklist }}
    - source: salt://squid-deb-proxy/files/pkg_blacklist.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      config: {{ squid_deb_proxy.server.pkg_blacklist }}
    - watch_in:
      - service: squid-deb-proxy_service

squid-deb-proxy_conf:
  file.managed:
    - name: {{ squid_deb_proxy.lookup.squid_deb_proxy_conf }}
    - source: salt://squid-deb-proxy/files/squid-deb-proxy.conf.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      config: {{ squid_deb_proxy.server.squid_deb_proxy_conf }}
    - watch_in:
      - service: squid-deb-proxy_service

squid-deb-proxy_service:
  service:
    - {{ service.get(squid_deb_proxy.server.enabled) }}
    - name: {{ squid_deb_proxy.lookup.service }}
    - enable: {{ squid_deb_proxy.server.enabled }}