# fpga-dev-env
FPGA development env in a virtual box

I created this repo as a means of supporting my FPGA development hobby on my MacBook Pro. Unfortunately, all the FPGA vendors seem to support Linux in a fairly limited way as their only Unix variant. This means that if I want to use their tools on my Mac, I have to run them in a VM. As I acquired different vendors FPGAs, I ended up needing these different vendors tool chains, so I have bundled them all into one VM, and captured the installation and configuration (as much as is possible) through the a combination of Vagrantfile and ansible playbooks.

There are, however, some manual steps you do need to do, unfortuately, as a one-off process. This is entirely due to some of the tools not being downloadable without going through a web form, or having to acquire a license file.

* Download Quartus II Web edition from the Intel Altera website at https://www.altera.com/downloads/software/quartus-ii-we/110sp1.html

* Copy the downloaded file `11.1sp2_259_quartus_free_linux.sh` to `tools/quartus`

* Download ISE from Xilinx website at https://www.xilinx.com/member/forms/download/xef.html?filename=Xilinx_ISE_DS_Lin_14.7_1015_1.tar&akdm=1
* Copy the downloaded file
`Xilinx_ISE_DS_Lin_14.7_1015_1.tar` to `tools/xilinx`

* Download Lattice Diamond from the website at
http://www.latticesemi.com/Products/DesignSoftwareAndIP/FPGAandLDS/LatticeDiamond.aspx
* Copy the downloaded file `diamond_3_9-sp1_x64-119-1-x86_64-linux.rpm` to `tools/lattice` 
