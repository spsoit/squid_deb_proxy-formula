===============
squid_deb_proxy
===============

Install the Deb proxy solution based on squid with a tweaked config file for
clients and/or server.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``squid_deb_proxy.client``
--------------------------

Installs an apt.conf.d configuration file pointing the client at the proxy server.

.. note::
    You need to change set the proxy target in the client pillar.

.. code:: yaml

    squid_deb_proxy:
      client:
        proxy_server:
          target: 
          grain: 'network.ip_addrs'
          
``squid_deb_proxy.server``
--------------------------

Installs squid-deb-proxy server.