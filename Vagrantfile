#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# This Vagrantfile sets up a Ubuntu based sandbox environment for running
# tools to support FPGAs from Altera, Xilinx and Lattice.

# Quartus II via X11, on an i386 architecture and using USB Blaster
# Quartus 16 via X11, on an x64 architecture and using USB Blaster
# ISE via X11, on an x64 architecture and using FTDI
# DesignLab via X11, on an x64 architecture and using FTDI and fpgaprog
# Lattice Diamond via X11, on an x64 architecture and using HW-USBN-2A programmer


# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "./tools/media","/opt/media", disabled: false
  config.vm.synced_folder "./tools/quartus","/opt/altera/quartus", disabled: false
  config.vm.synced_folder "./tools/lattice","/opt/lattice", disabled: false
  config.vm.synced_folder "./tools/pipistrello","/opt/pipistrello", disabled: false
  config.vm.synced_folder "./tools/xilinx","/opt/Xilinx", disabled: false
  config.vm.synced_folder "./tools/mojo","/opt/mojo", disabled: false
  config.vm.synced_folder "./vagrant","/vagrant", disabled: false

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--macaddress1", "080027e34021"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ['modifyvm', :id, '--memory', '4096']
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbehci", "on"]
    vb.customize ["usbfilter", "add", "0", 
      "--target", :id, 
      "--name", "18ff99d5-2fdb-4612-8c96-96d0326dcfec",
      "--manufacturer", "Arduino (www.arduino.cc)",
      "--product", "IOUSBHostDevice"]
    vb.customize ["usbfilter", "add", "0", 
      "--target", :id, 
      "--name", "50cd6786-d783-4494-9b37-65fe8af75bb1",
      "--vendorid", "0x09fb",
      "--productid", "0x6001",
      "--manufacturer", "Altera",
      "--product", "USB-Blaster"]
    vb.customize ["usbfilter", "add", "0",
      "--target", :id,
      "--name", "a5fab217-9d63-49e6-a8cf-06a616d8398f",
      "--manufacturer", "Embedded Micro",
      "--product", "Mojo V3"]
    vb.customize ["usbfilter", "add", "0",
      "--target", :id,
      "--name", "9dc7b780-9ec0-11d4-a54f-000a27052861",
      "--vendorid", "0x09fb",
      "--productid", "0x6001",
      "--manufacturer", "Altera",
      "--product", "USB-Blaster"]
    vb.customize ["usbfilter", "add", "0",
      "--target", :id,
      "--name", "Pipistrello",
      "--vendorid", "0x0403",
      "--productid", "0x6010",
      "--manufacturer", "Saanlima",
      "--product", "Pipistrello LX45"]
    vb.customize ["usbfilter", "add", "0",
      "--target", :id,
      "--name", "Lattice",
      "--vendorid", "0x1134",
      "--productid", "0x8001"]
  end

  config.vm.define :dev do |dev|
    # Port mappings for various services inside the VM

    dev.vm.provision :shell, path: "vagrant/bootstrap.sh"
    dev.vm.provision :shell, inline: 'PYTHONUNBUFFERED=1 ansible-playbook \
                                      /vagrant/ansible/dev.yml -c local'
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = true
    config.vbguest.no_install = false
    config.vbguest.no_remote = false
  end
end
