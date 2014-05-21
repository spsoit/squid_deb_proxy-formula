{% from 'squid-deb-proxy/map.jinja' import squid_deb_proxy with context %}

{#
  Special sauce here! We are going to collect the proxy host from the salt
  mine using parameters obtained from the minion's pillar data.
  Credit Chad for this cool idea.
#}
{% set proxy_server = salt['mine.get'](squid_deb_proxy.client.proxy_server.target, squid_deb_proxy.client.proxy_server.grain) %}

apt_conf_d:
  file.managed:
    - name: {{ squid_deb_proxy.lookup.apt_conf_d }}
    - source: salt://squid-deb-proxy/files/apt_conf_d.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      config: {{ proxy_server }}
