# ABSTRACT
Internet service providers and networking companies are apprehensive about implementing a software-defined network (SDN) as a universal solution, because of the lack of quality research done in the field. An application prone to latency and jitter can severely impact its performance leading to the dismal customer experience. Most service providers’ today need a network with fast provisioning and quick support. SDN aims to provide this capability to the service provider with a valid proposition of QoS. The proposed prototype of the SDN would demonstrate QoS and suggest ways to improve it. This document aims at finding ways to mitigate latency and suggest improvements in QoS in a SDN using the Floodlight OpenFlow controller. The performance testing to measure QoS would be done using the networking tool iPerf.

Keywords — software-defined network, Quality of Service Floodlight, OpenFlow, Mininet, Open vSwitch, jitter

### NETWORK TOPOLOGY<br />![Topology](https://github.com/savithruml/qos-capstone/blob/master/screenshots/Capture1.JPG "Topology")

### TOOLS USED

* Custom built OpenFlow Controller based on Floodlight
* Mininet Network Simulator
* Raspberry Pi running Open vSwitch
* Cisco Catalyst Switch
* Macintosh Machines as RTP/Data server & client

### COST OF IMPLEMENTATION<br />![CapEx](https://github.com/savithruml/qos-capstone/blob/master/screenshots/Capture.JPG "CapEx")

# INSTALLATION

## CONTROLLER NODE 

#### _Host OS_

* [Download](http://www.ubuntu.com/download/desktop) Ubuntu 14.04.X or later from Canonical's site<br /><br />
* [Install](http://www.ubuntu.com/download/desktop/install-ubuntu-desktop) Ubuntu on a standard x86 hardware & run <br /><br />`# sudo apt-get update`<br /><br />
* Assign a static IP on one of the interfaces

#### _Custom OpenFlow Controller (Ralphie)_

* Install the required packages for running the custom controller<br /><br />`# sudo apt-get install build-essential default-jdk ant python-dev`<br /><br /> 
* Download the controller package by cloning it in the local environment<br /><br />`# git clone https://github.com/savithruml/qos-capstone`<br /><br />
* Make the package<br /><br />`# cd qos-capstone`<br />`# sudo ./run.sh`<br /><br />
* Verify the installation. Open a web-browser & enter the following,<br /><br />`http://ralphie.com/ui/index.html`<br /><br />
![Ralphie Controller](https://github.com/savithruml/qos-capstone/blob/master/screenshots/Capture5.JPG "Ralphie Controller")<br />
<br />This confirms that the installation is complete.

## SWITCH NODE

* [Download & Install](https://www.raspberrypi.org/help/noobs-setup/) Raspbian OS on the **TWO** Raspberry Pis<br /><br />
* Assign static IP's in the same subnet as the controller<br /><br />
* Install dependencies on the Raspberry Pi by issuing the following commands,<br /><br />`# sudo apt-get update`<br />`# sudo apt-get -y upgrade`<br />`# sudo apt-cache search linux-source`<br />`# sudo apt-get install -y linux-source-3.18`<br />`# sudo apt-get install -y python-simplejson automake autoconf gcc uml-utilities libtool build-essential git`<br />`# sudo apt-get install pkg-config tcpdump iperf`<br />`# sudo reboot`<br /><br />[Download & Install](http://openvswitch.org) Open vSwitch<br /><br />`# wget http://openvswitch.org/releases/openvswitch-2.3.1.tar.gz`<br />`# tar zxvf openvswitch-2.3.1.tar.gz`<br />`# cd openvswitch-2.3.1`<br />`# sudo sh ./boot.sh`<br />`# sudo  ./configure`<br />`# sudo make`<br />`# sudo rpi-update`<br />`# sudo make install`<br />`# sudo modprobe openvswitch`<br /><br />Run the script [`install-ovs.sh`](https://github.com/savithruml/capstone-team-5/blob/master/install-ovs.sh) to complete the installation<br /><br />`# sudo ./install-ovs.sh`<br />

### TO CONFIGURE QOS

`# ./addClassMap.py --add -t service -O '{"name":"Video","tos":"101000"}' -c 127.0.0.1 -p 8080`<br />`# ./qosManager.py -L -t services`<br />
`# ./addQoSPolicy.py -a -S 10.0.0.1 -D 10.0.0.2 -N Test-QoS-Capstone` /
`-J '{"eth-type":"0x0800","protocol":"17","queue":"2","tos":"101000"}'`<br />`# ./qosManager.py -L -t policy`<br />

# RESULTS

### COMPARISON OF QoS PERFORMANCE CHARACTERISTICS<br />
As depicted in the graph below, we achieved ideal latency figures when using a SDN model with Mininet. These low figures of latency are not practically achievable in a physical network because of the latency introduced through routing and switching overhead. The traditional network model using Cisco routers represented by the red line on the graph initially had a low latency figure of about 75ms when compared to the SDN model. When the RTP burst traffic was introduced, as seen at around 25-40 second mark, the SDN model outperforms the traditional model by about 2-3 ms. This difference is attributed to the OVS performance of looking up flows. As time passes, the traditional network offers a better QoS performance characteristics than a SDN model. This difference can be attributed to the performance limitations of the hardware that is being used (Raspberry Pi) to run the OVS daemon.<br /><br />![QoS Performance Characteristics](https://github.com/savithruml/qos-capstone/blob/master/screenshots/Capture2.JPG "Comparison")

### SAMPLE OUTPUT<br />
Below are the screenshots of a video streaming on the client without and with QoS enabled in a SDN model. Figure 5.a depicts the distorted video output that is caused due to no prioritization of video traffic over data. After enabling the QoS module on our custom built controller, we were able to see a significant difference in the output of the video stream and this is seen in Figure 5.b.<br /><br />![sample output](https://github.com/savithruml/qos-capstone/blob/master/screenshots/Capture3.JPG "Output")
