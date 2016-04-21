# ABSTRACT
Internet service providers and networking companies are apprehensive about implementing a software-defined network (SDN) as a universal solution, because of the lack of quality research done in the field. An application prone to latency and jitter can severely impact its performance leading to the dismal customer experience. Most service providers’ today need a network with fast provisioning and quick support. SDN aims to provide this capability to the service provider with a valid proposition of QoS. The proposed prototype of the SDN would demonstrate QoS and suggest ways to improve it. This document aims at finding ways to mitigate latency and suggest improvements in QoS in a SDN using the Floodlight OpenFlow controller. The performance testing to measure QoS would be done using the networking tool iPerf.

Keywords — software-defined network, Quality of Service Floodlight, OpenFlow, Mininet, Open vSwitch, jitter

### TOOLS USED

* Custom built OpenFlow Controller based on Floodlight
* Mininet Network Simulator
* Raspberry Pi running Open vSwitch
* Cisco Catalyst Switch
* Macintosh Machines as RTP/Data server & client

Total Cost of the Project

![CapEx](https://github.com/savithruml/qos-capstone/blob/master/screenshots/Capture.JPG)

# INSTALLATION

## CONTROLLER NODE 

#### _Host OS_

* [Download](http://www.ubuntu.com/download/desktop) Ubuntu 14.04.X or later from Canonical's site<br /><br />
* [Install](http://www.ubuntu.com/download/desktop/install-ubuntu-desktop) Ubuntu on a standard x86 hardware & run <br /><br />`# sudo apt-get update`<br /><br />
* Assign a static IP on one of the interfaces

#### _Floodlight OpenFlow Controller_

* Install the required packages for running the custom controller<br /><br />`# sudo apt-get install build-essential default-jdk ant python-dev`<br /><br /> 
* Download the controller package by cloning it in the local environment<br /><br />`# git clone https://github.com/savithruml/qos-capstonet`<br /><br />
* Make the package<br /><br />`# cd qos-capstone`<br />`# ant; ./floodlight.sh`<br /><br />
* Verify the installation. Open a web-browser & enter the following,<br /><br />`http://localhost:8080/ui/index.html`<br /><br />This confirms that the installation is complete

## SWITCH NODE

* [Download & Install](https://www.raspberrypi.org/help/noobs-setup/) Raspbian OS on the **TWO** Raspberry Pis<br /><br />
* Assign static IP's in the same subnet as the controller<br /><br />
* Install dependencies on the Raspberry Pi by issuing the following commands,<br /><br />`# sudo apt-get update`<br />`# sudo apt-get -y upgrade`<br />`# sudo apt-cache search linux-source`<br />`# sudo apt-get install -y linux-source-3.18`<br />`# sudo apt-get install -y python-simplejson automake autoconf gcc uml-utilities libtool build-essential git`<br />`# sudo apt-get install pkg-config tcpdump iperf`<br />`# sudo reboot`<br /><br />[Download & Install](http://openvswitch.org) Open vSwitch<br /><br />`# wget http://openvswitch.org/releases/openvswitch-2.3.1.tar.gz`<br />`# tar zxvf openvswitch-2.3.1.tar.gz`<br />`# cd openvswitch-2.3.1`<br />`# sudo sh ./boot.sh`<br />`# sudo  ./configure`<br />`# sudo make`<br />`# sudo rpi-update`<br />`# sudo make install`<br />`# sudo modprobe openvswitch`<br /><br />Run the script [`install-ovs.sh`](https://github.com/savithruml/capstone-team-5/blob/master/install-ovs.sh) to complete the installation<br /><br />`# sudo ./install-ovs.sh`<br />
