#!/bin/sh

sudo echo "127.0.0.2	ralphie.com" >> /etc/hosts
sudo iptables -t nat -A OUTPUT -d 127.0.0.2 -p tcp --dport 80 -j REDIRECT --to-port 8080
ant; ./floodlight.sh
