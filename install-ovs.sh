#!/bin/bash

lsmod | grep openvswitch 
sudo touch /usr/local/etc/ovs-vswitchd.conf
sudo mkdir -p /usr/local/etc/openvswitch 
sudo ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema
sudo ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock --remote=db:Open_vSwitch,Open_vSwitch,manager_options --private-key=db:Open_vSwitch,SSL,private_key --certificate=db:Open_vSwitch,SSL,certificate --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert --pidfile --detach
sudo ovs-vsctl --no-wait init
sudo ovs-vswitchd --pidfile --detach
sudo sed -i '$a openvswitch' /etc/modules
cd /etc/init.d
sudo touch openvswitch
sudo sed -i '$a sudo ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock --remote=db:Open_vSwitch,Open_vSwitch,manager_options --private-key=db:Open_vSwitch,SSL,private_key --#certificate=db:Open_vSwitch,SSL,certificate --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert --pidfile --detach' /etc/init.d/openvswitch
sudo sed -i '$a sudo ovs-vsctl --no-wait init' /etc/init.d/openvswitch
sudo sed -i '$a sudo ovs-vswitchd --pidfile --detach ' /etc/init.d/openvswitch
sudo chmod 755 openvswitch
sudo update-rc.d openvswitch defaults

echo "Open vSwitch Installation Complete! Check status: /etc/init.d/openvswitch-switch status"
