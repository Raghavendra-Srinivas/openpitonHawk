`define HACD_AXI4_DATA_WIDTH  512
`define HACD_AXI4_ID_WIDTH    6
`define HACD_AXI4_ADDR_WIDTH  64
`define HACD_AXI4_LEN_WIDTH   8
`define HACD_AXI4_SIZE_WIDTH  3
`define HACD_AXI4_STRB_WIDTH  64
`define HACD_AXI4_BURST_WIDTH 2
`define HACD_AXI4_RESP_WIDTH  2
`define HACD_AXI4_CACHE_WIDTH 4
`define HACD_AXI4_PROT_WIDTH 3
`define HACD_AXI4_QOS_WIDTH 4
`define HACD_AXI4_REGION_WIDTH 4
`define HACD_AXI4_USER_WIDTH 11

`define HACD_AXI4_BURST_SIZE 3'b110 //for one memory block of 64bytes
`define HACD_AXI4_BURST_TYPE 2'b01 //for one memory block of 64bytes

`define HACD_AXI_MASTER_FIFO_DEPTH 32

//for MC
`define HACD_MC_AXI4_DATA_WIDTH  256
`define HACD_MC_AXI4_ID_WIDTH    6
`define HACD_MC_AXI4_ADDR_WIDTH  64
`define HACD_MC_AXI4_LEN_WIDTH   8
`define HACD_MC_AXI4_SIZE_WIDTH  3
`define HACD_MC_AXI4_STRB_WIDTH  32
`define HACD_MC_AXI4_BURST_WIDTH 2
`define HACD_MC_AXI4_RESP_WIDTH  2
`define HACD_MC_AXI4_CACHE_WIDTH 4
`define HACD_MC_AXI4_PROT_WIDTH 3
`define HACD_MC_AXI4_QOS_WIDTH 4
`define HACD_MC_AXI4_REGION_WIDTH 4
`define HACD_MC_AXI4_USER_WIDTH 11

`define HACD_MC_AXI4_BURST_SIZE 3'b110 //for one memory block of 64bytes
`define HACD_MC_AXI4_BURST_TYPE 2'b01 //for one memory block of 64bytes

