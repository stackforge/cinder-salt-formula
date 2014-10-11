==============
Cinder Formula
==============

Install and configure the OpenStack Cinder service.

.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``cinder``
----------

Install the Cinder and enable the service.

``cinder.db``
-------------

Create the db for Cinder service.

``cinder.keystone``
-------------------

Init the Cinder user, service and endpoint.

``cinder.server``
-----------------

Install the Cinder and enable the service.

``cinder.client``
-----------------

Install the python-cinderclient package.

``cinder.volume``
-----------------

Install the Cinder Volume Service
