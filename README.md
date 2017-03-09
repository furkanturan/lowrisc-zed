# LowRISC on ZedBoard
Zynq devices are great for many hardware developers, and available with low-cost and highly useful development boards. These devices are also preferred in some implementations of RISC-V; hosting it as a neighbour to the device's hard-coded ARM cores. However, in many Zynq development boards, the ARM cores are dominant: every peripheral or ports connects to Zynq’s ARM Processing System (PS), but not reachable from Programmable Logic (PS). That makes the RISC-V inaccessible from outside without passing through the ARM cores. Therefore, these RISC-V implementations on Zynq (including the original release by Berkeley or the earliest lowRISC design) use so called Host/Target Interface (HTIF), which has the front-end server running on PS and communicating with the target RISC-V implemented in PL.

The achievement of lowRISC to offer an untethered RISC-V implementation is great; however, made the design leave Zynq. Within this repository, a port of lowRISC (v3 branch) to Zynq on Zedboard is given; although, it requires a little expense to be made on top of the Zedboard, which is obtaining two PMOD modules; one for SD Card and the other for UART.
 
![Zedboard with PMODs](https://github.com/furkanturan/lowrisc-zed/blob/master/boardimage.jpg "Zedboard with PMODs")

As SD Card and UART ports on ZedBoard are connected directly to ARM, the two PMOD modules are used to provide RISC-V with dedicated IO. 

* [Pmod SD](http://store.digilentinc.com/pmod-sd-full-sized-sd-card-slot/)
* [Pmod RS232](http://store.digilentinc.com/pmod-usbuart-usb-to-uart-interface/)
* [Pmod USBUART](http://store.digilentinc.com/pmod-usbuart-usb-to-uart-interface/)

Dedicated IO is provided to RISC-V with PMODs. However, the Zedboard has a single DDR RAM, and it cannot be allocated for the explicit use of RISC-V. Therefore, the implementation made the RAM it shared between the ARM and RISC-V cores. The `chip-top.v` file is expanded to make nasti memory port of RISC-V accessible as global port instead of connecting it to MIG IP Core. On top of this, a block diagram is provided which instantiates ARM PS7 and implements an clock, reset signals from PS7, as well as an AXI port to PS7’s memory through the HP0 port. Finally, a `Wrapper.v` is provided as top-design file, which connects ARM and RISC-V.

## How to work with?
This is not a stand-alone git repo. It requires lowRISC development environment. Please clone https://github.com/furkanturan/lowrisc-chip and have this repository as a submodule `lowrisc-chip/fpga/board/zed`

### Programming
This is slightly different compared to Nexys and KC705 implementations, as there is a hardcoded ARM on the Zynq device. It works in parallel to RISC-V. In addition to the existence of ARM, it is the owner of the DDR memory, and shares it with RISC-V. Therefore, the memory access of the software running on ARM is also something that should be considered.

### Makefile Structure
The makefile of Nexys 4 DDR is kept almost without changes; all the targets are same. Thus, below is just a copy from before:

How to run the demo:
--------------------------------------------------------

* Generate bit-stream for downloading

        make bitstream

* Run FPGA simulation (extremely slow due to the DDR3 memory controller)

        make simulation

* Open the Vivado GUI

        make vivado

Other Make targets
--------------------------------------------------------

* Generate the FPGA backend Verilog files

        make verilog

* Generate the Vivado project

        make project

* Find out the boot BRAMs' name and position (for updating src/boot.bmm)

        make search-ramb

* Replace the content of boot BRAM with a new src/boot.mem (must update src/boot.bmm first)

        make bit-update

## Remarks
* Thanks to great work of lowRISC people, it was never required to run simulation, small changes into existing work was enough for porting lowRISC to Zedboard, and running Linux on it.

* It is only tested with Vivado 2016.2

* As memory is shared between ARM and RISC-V, a small restriction to ARM's memory use should be useful. I will have a look at doing it through the SDK project. If successful, I may provide a pre-configured project and let the Makefile or the tcl script to load it.