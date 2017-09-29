# Lattice Diamond installation

This directory serves the purpose of providing the necessary configuration,
and a persistent location for the installation of the Lattice Diamond tools.

See http://www.latticesemi.com/Products/DesignSoftwareAndIP/FPGAandLDS/LatticeDiamond.aspx
for instructions on downloading a free license for Diamond.

When you have downloaded one, you need to do several things:

* First you need to identify and set a fixed MAC address for your VM, as Lattice use that for their licenses. You can do this by using whatever has been assigned by Virtual Box but then making sure Vagrant always uses the same value. You can do this as follows:

  You can find the MAC address by doing an `ifconfig eth0` from within the VM and looking for the 12-digit HW address.
```
vagrant@vagrant-ubuntu-trusty-64:~$ ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 08:00:12:34:56:78  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fee3:4021/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:5186 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3554 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:553039 (553.0 KB)  TX bytes:488032 (488.0 KB)
```
* Add a line in `../../Vagrantfile` as below but set the MAC address to be what your virtualbox VM reports, but without the colons.
```
     vb.customize ["modifyvm", :id, "--macaddress1", "080012345678"]
```
* Go to the Lattice website and register for a free Diamond license using that MAC address.
* Place the file in the `./diamond` directory and call it `license.dat`
