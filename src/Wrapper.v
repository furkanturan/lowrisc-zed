`timescale 1ns / 1ps

module wrapper(
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    UART_RX,
    UART_TX,
    UART_CTS,
    UART_RTS,
    SPI_CS,
    SPI_SCLK,
    SPI_MOSI,
    SPI_MISO
    );
    
    inout [14:0] DDR_addr;
    inout  [2:0] DDR_ba;
    inout        DDR_cas_n;
    inout        DDR_ck_n;
    inout        DDR_ck_p;
    inout        DDR_cke;
    inout        DDR_cs_n;
    inout  [3:0] DDR_dm;
    inout [31:0] DDR_dq;
    inout  [3:0] DDR_dqs_n;
    inout  [3:0] DDR_dqs_p;
    inout        DDR_odt;
    inout        DDR_ras_n;
    inout        DDR_reset_n;
    inout        DDR_we_n;
    inout        FIXED_IO_ddr_vrn;
    inout        FIXED_IO_ddr_vrp;
    inout [53:0] FIXED_IO_mio;
    inout        FIXED_IO_ps_clk;
    inout        FIXED_IO_ps_porb;
    inout        FIXED_IO_ps_srstb;
    input        UART_RX;
    output       UART_TX;
    input        UART_CTS;
    output       UART_RTS;
    inout        SPI_CS;
    inout        SPI_SCLK;
    inout        SPI_MOSI;
    inout        SPI_MISO;
     
    wire  [14:0] DDR_addr;
    wire   [2:0] DDR_ba;
    wire         DDR_cas_n;
    wire         DDR_ck_n;
    wire         DDR_ck_p;
    wire         DDR_cke;
    wire         DDR_cs_n;
    wire   [3:0] DDR_dm;
    wire  [31:0] DDR_dq;
    wire   [3:0] DDR_dqs_n;
    wire   [3:0] DDR_dqs_p;
    wire         DDR_odt;
    wire         DDR_ras_n;
    wire         DDR_reset_n;
    wire         DDR_we_n;
    wire         FIXED_IO_ddr_vrn;
    wire         FIXED_IO_ddr_vrp;
    wire  [53:0] FIXED_IO_mio;
    wire         FIXED_IO_ps_clk;
    wire         FIXED_IO_ps_porb;
    wire         FIXED_IO_ps_srstb;
    wire         UART_RX;
    wire         UART_TX;
    wire         UART_CTS;
    wire         UART_RTS;
    wire         SPI_CS;
    wire         SPI_SCLK;
    wire         SPI_MOSI;
    wire         SPI_MISO;
     
    wire         PStoPL_CLK;
    wire         PStoPL_RSTN;
    
    wire [31:0]  S_AXI_araddr;
    wire  [1:0]  S_AXI_arburst;
    wire  [3:0]  S_AXI_arcache;
    wire  [5:0]  S_AXI_arid;
    wire  [7:0]  S_AXI_arlen;
    wire         S_AXI_arlock;
    wire  [2:0]  S_AXI_arprot;
    wire  [3:0]  S_AXI_arregion;
    wire  [3:0]  S_AXI_arqos;
    wire         S_AXI_arready;
    wire  [2:0]  S_AXI_arsize;
    wire         S_AXI_arvalid;
    wire [31:0]  S_AXI_awaddr;
    wire  [1:0]  S_AXI_awburst;
    wire  [3:0]  S_AXI_awcache;
    wire  [5:0]  S_AXI_awid;
    wire  [7:0]  S_AXI_awlen;
    wire         S_AXI_awlock;
    wire  [2:0]  S_AXI_awprot;
    wire  [3:0]  S_AXI_awregion;
    wire  [3:0]  S_AXI_awqos;
    wire         S_AXI_awready;
    wire  [2:0]  S_AXI_awsize;
    wire         S_AXI_awvalid;
    wire  [5:0]  S_AXI_bid;
    wire         S_AXI_bready;
    wire  [1:0]  S_AXI_bresp;
    wire         S_AXI_bvalid;
    wire [63:0]  S_AXI_rdata;
    wire  [5:0]  S_AXI_rid;
    wire         S_AXI_rlast;
    wire         S_AXI_rready;
    wire  [1:0]  S_AXI_rresp;
    wire         S_AXI_rvalid;
    wire [63:0]  S_AXI_wdata;
    wire         S_AXI_wlast;
    wire         S_AXI_wready;
    wire  [7:0]  S_AXI_wstrb;
    wire         S_AXI_wvalid;
   
    // There is a modification to read and write addresses signals asserted
    // by RISC-V. That is to map every address request of RISC-V to another
    // place on DDR memory on Zedboard.
    //
    // The default Zedboard configuration on Configs.scala sets the memory 
    // base address of RISC-V to 0x80000000, and the trick below maps maps 
    // that base address to 0x10000000 on the Zedboard's DDR memory.  
    
    zedbd armps
    (
        .PL_CLK                 (PStoPL_CLK       ),            
        .PL_RSTN                (PStoPL_RSTN      ),   
                  
        .DDR_addr               (DDR_addr         ),          
        .DDR_ba                 (DDR_ba           ),        
        .DDR_cas_n              (DDR_cas_n        ),           
        .DDR_ck_n               (DDR_ck_n         ),          
        .DDR_ck_p               (DDR_ck_p         ),          
        .DDR_cke                (DDR_cke          ),         
        .DDR_cs_n               (DDR_cs_n         ),          
        .DDR_dm                 (DDR_dm           ),        
        .DDR_dq                 (DDR_dq           ),        
        .DDR_dqs_n              (DDR_dqs_n        ),           
        .DDR_dqs_p              (DDR_dqs_p        ),           
        .DDR_odt                (DDR_odt          ),         
        .DDR_ras_n              (DDR_ras_n        ),           
        .DDR_reset_n            (DDR_reset_n      ),             
        .DDR_we_n               (DDR_we_n         ),  
                
        .FIXED_IO_ddr_vrn       (FIXED_IO_ddr_vrn ),                  
        .FIXED_IO_ddr_vrp       (FIXED_IO_ddr_vrp ),                  
        .FIXED_IO_mio           (FIXED_IO_mio     ),              
        .FIXED_IO_ps_clk        (FIXED_IO_ps_clk  ),                 
        .FIXED_IO_ps_porb       (FIXED_IO_ps_porb ),                  
        .FIXED_IO_ps_srstb      (FIXED_IO_ps_srstb),    
                       
        .S_AXI_MEMCNT_araddr    ( {4'b0001, S_AXI_araddr[27:0]} ), 
        //.S_AXI_MEMCNT_araddr    (S_AXI_araddr     ),             
        .S_AXI_MEMCNT_arburst   (S_AXI_arburst    ),               
        .S_AXI_MEMCNT_arlock    (S_AXI_arlock     ),      
        .S_AXI_MEMCNT_arcache   (S_AXI_arcache    ),               
        .S_AXI_MEMCNT_arid      (S_AXI_arid       ),            
        .S_AXI_MEMCNT_arlen     (S_AXI_arlen      ),              
        .S_AXI_MEMCNT_arprot    (S_AXI_arprot     ),              
        .S_AXI_MEMCNT_arregion  (S_AXI_arregion   ),                
        .S_AXI_MEMCNT_arqos     (S_AXI_arqos      ),             
        .S_AXI_MEMCNT_arready   (S_AXI_arready    ),               
        .S_AXI_MEMCNT_arsize    (S_AXI_arsize     ),              
        .S_AXI_MEMCNT_arvalid   (S_AXI_arvalid    ),              
        .S_AXI_MEMCNT_awaddr    ( {4'b0001, S_AXI_awaddr[27:0]} ),   
        //.S_AXI_MEMCNT_awaddr    (S_AXI_awaddr     ),                        
        .S_AXI_MEMCNT_awburst   (S_AXI_awburst    ),               
        .S_AXI_MEMCNT_awlock    (S_AXI_awlock     ),      
        .S_AXI_MEMCNT_awcache   (S_AXI_awcache    ),               
        .S_AXI_MEMCNT_awid      (S_AXI_awid       ),            
        .S_AXI_MEMCNT_awlen     (S_AXI_awlen      ),              
        .S_AXI_MEMCNT_awprot    (S_AXI_awprot     ),              
        .S_AXI_MEMCNT_awregion  (S_AXI_awregion   ),                
        .S_AXI_MEMCNT_awqos     (S_AXI_awqos      ),             
        .S_AXI_MEMCNT_awready   (S_AXI_awready    ),               
        .S_AXI_MEMCNT_awsize    (S_AXI_awsize     ),              
        .S_AXI_MEMCNT_awvalid   (S_AXI_awvalid    ),               
        .S_AXI_MEMCNT_bid       (S_AXI_bid        ),           
        .S_AXI_MEMCNT_bready    (S_AXI_bready     ),              
        .S_AXI_MEMCNT_bresp     (S_AXI_bresp      ),             
        .S_AXI_MEMCNT_bvalid    (S_AXI_bvalid     ),              
        .S_AXI_MEMCNT_rdata     (S_AXI_rdata      ),             
        .S_AXI_MEMCNT_rid       (S_AXI_rid        ),           
        .S_AXI_MEMCNT_rlast     (S_AXI_rlast      ),             
        .S_AXI_MEMCNT_rready    (S_AXI_rready     ),              
        .S_AXI_MEMCNT_rresp     (S_AXI_rresp      ),             
        .S_AXI_MEMCNT_rvalid    (S_AXI_rvalid     ),             
        .S_AXI_MEMCNT_wdata     (S_AXI_wdata      ),             
        .S_AXI_MEMCNT_wlast     (S_AXI_wlast      ),             
        .S_AXI_MEMCNT_wready    (S_AXI_wready     ),              
        .S_AXI_MEMCNT_wstrb     (S_AXI_wstrb      ),             
        .S_AXI_MEMCNT_wvalid    (S_AXI_wvalid     )
    );
    
    chip_top riscvpc
    (
        .clk_p                   (PStoPL_CLK     ),
        .clk_n                   (1'b0           ),
        .rst_top                 (!PStoPL_RSTN   ),
        
        .mem_nasti_dram_araddr   (S_AXI_araddr   ),
        .mem_nasti_dram_arburst  (S_AXI_arburst  ),
        .mem_nasti_dram_arcache  (S_AXI_arcache  ),
        .mem_nasti_dram_arid     (S_AXI_arid     ),
        .mem_nasti_dram_arlen    (S_AXI_arlen    ),
        .mem_nasti_dram_arlock   (S_AXI_arlock   ),
        .mem_nasti_dram_arprot   (S_AXI_arprot   ),
        .mem_nasti_dram_arqos    (S_AXI_arqos    ),
        .mem_nasti_dram_arready  (S_AXI_arready  ),
        .mem_nasti_dram_arsize   (S_AXI_arsize   ),
        .mem_nasti_dram_arvalid  (S_AXI_arvalid  ),
        .mem_nasti_dram_arregion (S_AXI_arregion ),
        .mem_nasti_dram_awaddr   (S_AXI_awaddr   ),
        .mem_nasti_dram_awburst  (S_AXI_awburst  ),
        .mem_nasti_dram_awcache  (S_AXI_awcache  ),
        .mem_nasti_dram_awid     (S_AXI_awid     ),
        .mem_nasti_dram_awlen    (S_AXI_awlen    ),
        .mem_nasti_dram_awlock   (S_AXI_awlock   ),
        .mem_nasti_dram_awprot   (S_AXI_awprot   ),
        .mem_nasti_dram_awqos    (S_AXI_awqos    ),
        .mem_nasti_dram_awready  (S_AXI_awready  ),
        .mem_nasti_dram_awsize   (S_AXI_awsize   ),
        .mem_nasti_dram_awvalid  (S_AXI_awvalid  ),
        .mem_nasti_dram_awregion (S_AXI_awregion ),
        .mem_nasti_dram_bid      (S_AXI_bid      ),
        .mem_nasti_dram_bready   (S_AXI_bready   ),
        .mem_nasti_dram_bresp    (S_AXI_bresp    ),
        .mem_nasti_dram_bvalid   (S_AXI_bvalid   ),
        .mem_nasti_dram_rdata    (S_AXI_rdata    ),
        .mem_nasti_dram_rid      (S_AXI_rid      ),
        .mem_nasti_dram_rlast    (S_AXI_rlast    ),
        .mem_nasti_dram_rready   (S_AXI_rready   ),
        .mem_nasti_dram_rresp    (S_AXI_rresp    ),
        .mem_nasti_dram_rvalid   (S_AXI_rvalid   ),
        .mem_nasti_dram_wdata    (S_AXI_wdata    ),
        .mem_nasti_dram_wlast    (S_AXI_wlast    ),
        .mem_nasti_dram_wready   (S_AXI_wready   ),
        .mem_nasti_dram_wstrb    (S_AXI_wstrb    ),
        .mem_nasti_dram_wvalid   (S_AXI_wvalid   ),
        
        .rxd                     (UART_RX        ),
        .txd                     (UART_TX        ),
        .cts                     (UART_CTS       ),
        .rts                     (UART_RTS       ),
        
        .spi_cs                  (SPI_CS         ),
        .spi_sclk                (SPI_SCLK       ),
        .spi_mosi                (SPI_MOSI       ),
        .spi_miso                (SPI_MISO       )
    );
    
endmodule
