//Description:
// Supports multiple modes , controlled by hawk control unit
// INIT_ATT and INIT_LIST : Initialize ATT table and make one long free list in list table
//
`include "hacd_define.vh"
import hacd_pkg::*;
`define FSM_WID 4
module hawk_pgwr_mngr #(parameter int PWRUP_UNCOMP=0) (

  input clk_i,
  input rst_ni,

  input wire init_att,
  input wire init_list,  //change this to mode later 

  //AXI packets
  input hacd_pkg::axi_wr_rdypkt_t wr_rdypkt,
  output hacd_pkg::axi_wr_reqpkt_t wr_reqpkt,
  input hacd_pkg::axi_wr_resppkt_t wr_resppkt,

  //to rd manager
  output hacd_pkg::hawk_tol_ht_t tol_HT,

  //table update request pgrd_mangr
  input hacd_pkg::tol_updpkt_t tol_updpkt,
  //status handshake to main comntroller
  output logic init_att_done, 
  output logic init_list_done,
  output logic pgwr_mngr_ready,
  output wire tbl_update_done,

  output wire dump_mem  //this is used to help in  DV sims to dump mem when desired during different phase during same sims
);

//list head and tails
logic [clogb2(LST_ENTRY_MAX)-1:0] n_freeListHead,freeListHead;
logic [clogb2(LST_ENTRY_MAX)-1:0] n_freeListTail,freeListTail;
logic [clogb2(LST_ENTRY_MAX)-1:0] n_uncompListHead,uncompListHead;
logic [clogb2(LST_ENTRY_MAX)-1:0] n_uncompListTail,uncompListTail;

wire tbl_update;
wire [clogb2(ATT_ENTRY_MAX)-1:0] attEntryId;
wire [clogb2(LST_ENTRY_MAX)-1:0] tolEntryId;
wire [1:0] src_list; //from which source we are removing this entry
wire [1:0] dst_list; //to which list , we are moving this entry
wire [127:114] rsvd; 
wire [113:64] way;
wire [63:32] prev;
wire [31:0] next;

assign tbl_update=tol_updpkt.tbl_update;
assign attEntryId=tol_updpkt.attEntryId;
assign tolEntryId=tol_updpkt.tolEntryId;
assign src_list=tol_updpkt.src_list;
assign dst_list=tol_updpkt.dst_list;
assign way=tol_updpkt.lstEntry.way;
assign prev=tol_updpkt.lstEntry.prev;
assign next=tol_updpkt.lstEntry.next;

//fsm variables  
logic [clogb2(ATT_ENTRY_MAX):0] p_etry_cnt,n_etry_cnt;  //serves as entry id
logic p_req_awvalid,p_req_wvalid,n_req_awvalid,n_req_wvalid;
logic n_init_att_done,n_init_list_done;
typedef logic [`FSM_WID-1:0] state_t;
state_t n_state;
state_t p_state;
//states
localparam IDLE			     ='d0,
	   INIT_ATT		     ='d1,
	   WAIT_ATT		     ='d2,
	   INIT_LIST		     ='d3,
	   WAIT_LIST		     ='d4,
	   ATT_UPDATE		     ='d5,
	   WAIT_ATT_UPDATE	     ='d6,
	   TOL_SLST_UPDATE	     ='d7,
	   WAIT_TOL_SLST_UPDATE      ='d8,
	   TOL_DLST_UPDATE1	     ='d9,
	   WAIT_TOL_DLST_UPDATE1     ='d10,
	   TOL_DLST_UPDATE2	     ='d11,
	   WAIT_TOL_DLST_UPDATE2     ='d12,
	   TBL_UPDATE_WAIT_RESP      ='d13;


//helper functions
function axi_wr_pld_t get_axi_wr_pkt;
	input [clogb2(ATT_ENTRY_MAX)-1:0] etry_cnt;
	input state_t p_state;
	input [63:0] addr;
	integer i;
	logic [63:0] ppa;

	bit [511:0] data;
	bit [63:0] wstrb;
	//axi_wr_pld_t get_axi_wr_pkt;
        AttEntry att_entry;
	ListEntry lst_entry;
	get_axi_wr_pkt.strb ='d0;
	get_axi_wr_pkt.data ='d0;
	lst_entry.rsvd = 'd0;

        if(etry_cnt=='d1) begin
	   ppa = (HAWK_PPA_START>>12);
	end
	else begin	
	   ppa = (HAWK_PPA_START>>12)+ etry_cnt-1; //incremnt by 4KB for ppa
	end
	//optimization, 
	//if we are in Init mode, we can send entire wstrb once, as we know
	//data for entire cache line 
	if      (p_state == INIT_ATT) begin
		   //increment address by 64 (8 entries)
		   if (etry_cnt[2:0] == 3'b001) begin
		   	get_axi_wr_pkt.addr = addr + 64'd64; //;get_att_addr()
		   end else begin
		   	get_axi_wr_pkt.addr = addr; //;get_att_addr()
		   end
		   	
		   if (p_etry_cnt <= LIST_ENTRY_CNT && PWRUP_UNCOMP==1) begin
		       att_entry.zpd_cnt='d0;
		       att_entry.sts= STS_UNCOMP;//1'b0;	
		       att_entry.way=ppa;
		   end else begin
		       att_entry.zpd_cnt='d0;
		       att_entry.sts= STS_DALLOC;//1'b0;	
		       att_entry.way='d0;
		   end 
		    
		    i= (etry_cnt[2:0] == 3'b000) ? 'd7: (etry_cnt[2:0]-1);
		    data[(i*ATT_ENTRY_SIZE*BYTE)+:ATT_ENTRY_SIZE*BYTE] = {att_entry.zpd_cnt,att_entry.way,att_entry.sts};
		    wstrb[i*8+:8]={8{1'b1}};
		    
		   //for (i=0;i<(BLK_SIZE/ATT_ENTRY_SIZE);i++) begin
		   // att_entry.way=ppa+i; 
		   // data[(i*ATT_ENTRY_SIZE*BYTE)+:ATT_ENTRY_SIZE*BYTE] = {att_entry.zpd_cnt,att_entry.way,att_entry.sts}; 
	           //end
		   //wstrb = {64{1'b1}};
        end
	else if (p_state == INIT_LIST ) begin
		   if (etry_cnt[1:0] == 2'b01) begin
		   	get_axi_wr_pkt.addr = addr + 64'd64; //;get_att_addr()
		   end else begin
		   	get_axi_wr_pkt.addr = addr; //;get_att_addr()
		   end
		   
		   //lst entry
		    lst_entry.way = ppa; //(ppa>>12) + 1;
		    lst_entry.prev = etry_cnt - 1; //entry_count = 0 is initilizaed to 0 and equivalent to NULL
		    lst_entry.next = etry_cnt + 1;
		    if (etry_cnt[1:0] == 2'b01) begin
		    	data[127:0] = {lst_entry.rsvd,lst_entry.way,lst_entry.prev,lst_entry.next}; 
		        wstrb[15:0] ={16{1'b1}};
		    end
		    else if  (etry_cnt[1:0] == 2'b10) begin
		    	data[255:128] = {lst_entry.rsvd,lst_entry.way,lst_entry.prev,lst_entry.next}; 
		        wstrb[31:16] ={16{1'b1}};
		    end	
		    else if  (etry_cnt[1:0] == 2'b11) begin
		    	data[383:256] = {lst_entry.rsvd,lst_entry.way,lst_entry.prev,lst_entry.next}; 
		        wstrb[47:32] ={16{1'b1}};
		    end	
		    else if  (etry_cnt[1:0] == 2'b00) begin
		    	data[511:384] = {lst_entry.rsvd,lst_entry.way,lst_entry.prev,lst_entry.next}; 
		        wstrb[63:48] ={16{1'b1}};
		    end
	end
	//Test byte swap/endianess of riscv core
	//data=511'h0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF;
 	get_axi_wr_pkt.data = get_8byte_byteswap(data); //511'h0123456789ABCDEF;		
	get_axi_wr_pkt.strb = get_strb_swap(wstrb);		
endfunction



function axi_wr_pld_t get_tbl_axi_wrpkt;
	input tol_updpkt_t tbl_updat_pkt;
	input state_t p_state;
        input hacd_pkg::hawk_tol_ht_t tol_HT;
	integer i;
	bit [511:0] data='d0;
	bit [63:0] wstrb='d0;
        AttEntry att_entry='d0;
	ListEntry next_lst_entry='d0; //for pop
	ListEntry my_lst_entry='d0; //for push
	
	att_entry.way='d0;
	att_entry.sts=STS_DALLOC;
	get_tbl_axi_wrpkt.data='d0;
	get_tbl_axi_wrpkt.strb='d0;
        wstrb[63:0]= {64{1'b0}};
	
	if (p_state==ATT_UPDATE) begin
		get_tbl_axi_wrpkt.addr=HAWK_ATT_START + (((tbl_updat_pkt.attEntryId-1) >> 3) << 6);
		att_entry.zpd_cnt='d0;
		att_entry.way=tbl_updat_pkt.lstEntry.way;  //list way would go into att_entry.way field for allocation
		
		if(tbl_updat_pkt.dst_list==UNCOMP) begin
			att_entry.sts=STS_UNCOMP;
		end
		
		//Which 64 bit we need to send this.
		//case(attEntryId[2:0])
		i=(tbl_updat_pkt.attEntryId[2:0] == 3'b000)?'d7:(tbl_updat_pkt.attEntryId[2:0]-1);
		data[64*i+:64]=att_entry;
		wstrb[8*i+:8]={8{1'b1}};
	end
	else if (p_state==TOL_SLST_UPDATE) begin  //POP FREE LIST , POP entry from head is same as updating prev of next entry to head, then update head to that

		//Original: freehead=Entry-1    -> ||prev=0,Entry=1,next=2||prev=1,Entry=2,next=3||
		//AfterUpdate:freehead->Entry-2 -> ||prev=0,Entry=2,next=3||..
		
		//Change next entries content
		get_tbl_axi_wrpkt.addr=HAWK_LIST_START + (((tbl_updat_pkt.lstEntry.next-1) >> 2) << 6);
	
		//Which entry we shoudl change in cacheline
		i= (tbl_updat_pkt.lstEntry.next[1:0] == 2'b00 ) ? 3 : (tbl_updat_pkt.lstEntry.next[1:0]-1);
		data[(128*i+32)+:32]=tbl_updat_pkt.lstEntry.prev; //pointers are 32 bits //only prev changes, remaining remains same
		wstrb[(16*i+4)+:4]={4{1'b1}}; //pointers are 4 bytes
	end
	else if (p_state==TOL_DLST_UPDATE1) begin //PUSH BACK on tail of UNCOMPRESSED LIST
		get_tbl_axi_wrpkt.addr=HAWK_LIST_START + (((tbl_updat_pkt.tolEntryId-1) >> 2) << 6);
	
		my_lst_entry.prev= tol_HT.uncompListTail;	
		my_lst_entry.next= 'd0; //I am pointing to null/tail now, update UNCOMP_TAIL in next cycle	
		i=(tbl_updat_pkt.tolEntryId[1:0]==2'b00)? 3 : (tbl_updat_pkt.tolEntryId[1:0]-1);
		data[128*i+:64]={my_lst_entry.prev,my_lst_entry.next}; //we update both prev and next for push
		wstrb[16*i+:8]={8{1'b1}};
	end
	else if (p_state==TOL_DLST_UPDATE2) begin //PUSH BACK on tail of UNCOMPRESSED LIST
		 get_tbl_axi_wrpkt.addr=HAWK_LIST_START + (((tol_HT.uncompListTail-1) >> 2) << 6);
	
		i=(tol_HT.uncompListTail[1:0]==2'b00)? 3 : (tol_HT.uncompListTail[1:0]-1);
		data[128*i+:32]=tbl_updat_pkt.tolEntryId; //we update next of previous entry to me for push back
		wstrb[16*i+:4]={4{1'b1}};
	end
 	get_tbl_axi_wrpkt.data = data; //get_8byte_byteswap(data); //511'h0123456789ABCDEF;
	get_tbl_axi_wrpkt.strb = wstrb;//get_strb_swap(wstrb);		
endfunction

//From fsm manager point of view, I will unify readiness of addr and data channels, because
//For birngup phase, we always work only hawk_master if both addr and data channels are ready and at cache line granularity always
wire awready,wready;
wire awvalid,wvalid;
logic bresp_cmplt;
assign awready = wr_rdypkt.awready;// & wr_rdypkt.wready;
assign awvalid = wr_reqpkt.awvalid; // & vldpkt.wvalid;

assign wready = wr_rdypkt.wready;// & wr_rdypkt.wready;
assign wvalid = wr_reqpkt.wvalid; // & vldpkt.wvalid;

axi_wr_pld_t p_axireq,n_axireq;
tol_updpkt_t n_tol_updpkt,p_tol_updpkt;
//logic to handle different modes
always@* begin
//default
	n_init_att_done = 1'b0;
	n_etry_cnt = p_etry_cnt; 
	n_state=p_state;	       //be in same state unless fsm decides to jump
	n_axireq= p_axireq;
	n_etry_cnt = p_etry_cnt;         //retain previous
	n_req_awvalid = 1'b0; 	       //reset->fsm decides when to send packet
	n_req_wvalid = 1'b0; 	       //reset->fsm decides when to send packet

	n_tol_updpkt=p_tol_updpkt;

	//default list head/tails
	n_freeListHead=freeListHead;
	n_freeListTail=freeListTail;
	n_uncompListHead=uncompListHead;
	n_uncompListTail=uncompListTail;

	case(p_state)
		IDLE: begin
			//Put into target operating mode, along with
			//initial values on required variables as
			//needed //This handles only one mode at a time.
			if      (init_att & !init_att_done) begin //wait in same state till table initialiation is done
				n_state=INIT_ATT;
				n_axireq.addr = HAWK_ATT_START-64'h40;  
				n_etry_cnt = 'd1;
			end
			else if (init_list & !init_list_done) begin
				n_state=INIT_LIST;
				n_axireq.addr = HAWK_LIST_START-64'h40; //We can change this to any address if list tbael does not follow att immediately
				n_etry_cnt = 'd1;
				n_freeListHead = 'd1;
			end
			else if(tol_updpkt.tbl_update) begin
				n_state=ATT_UPDATE;
			 	n_tol_updpkt=tol_updpkt;	
			end

		end
		INIT_ATT:begin
			  if(awready && !awvalid) begin
				  //handle ATT initialization 
				  if(p_etry_cnt <=(ATT_ENTRY_CNT)) begin //8 becuase 8 entry
				     n_axireq = get_axi_wr_pkt(p_etry_cnt,p_state,p_axireq.addr); //prepare next packet
				     n_req_awvalid = 1'b1;
			  	     n_etry_cnt = p_etry_cnt + 1;
				     n_state = WAIT_ATT;
				  end
				  else begin
				     n_init_att_done = 1'b1;		  
				     n_state = IDLE;
				  end

			  end 
		end
		WAIT_ATT: begin //we can hve multipel beats, but for simplicity I maintin only one beat transaction per INCR type of burst on entire datapath of hawk
			  if(wready && !wvalid) begin //data has been already set, in prev state, just assert wvalid
				     n_req_wvalid = 1'b1;
				     n_state = INIT_ATT;
			  end
		end
		INIT_LIST:begin
			  if(awready && !awvalid) begin
				  //handle LIST initialization
				  if (p_etry_cnt <= LIST_ENTRY_CNT) begin
				     n_axireq = get_axi_wr_pkt(p_etry_cnt,p_state,p_axireq.addr); //prepare next packet
				     
				     n_req_awvalid = 1'b1;
			  	     n_etry_cnt = p_etry_cnt + 1;
				     n_state = WAIT_LIST;
				  end
				  else begin
					n_freeListTail=p_etry_cnt-'d1;
				        n_init_list_done = 1'b1;		  
					n_state = IDLE;
				  end
			  end 
		end	
		WAIT_LIST: begin //we can hve multipel beats, but for simplicity I maintin only one beat transaction per INCR type of burst on entire datapath of hawk
			  if(wready && !wvalid) begin //data has been already set, in prev state, just assert wvalid
				     n_req_wvalid = 1'b1;
				     n_state = INIT_LIST;
			  end
		end
		ATT_UPDATE : begin
			  if(awready && !awvalid) begin
				     n_axireq = get_tbl_axi_wrpkt(p_tol_updpkt,p_state,tol_HT); //prepare next packet
				     n_req_awvalid = 1'b1;
				     n_state = WAIT_ATT_UPDATE;
			  end
		end
		WAIT_ATT_UPDATE: begin
			  if(wready && !wvalid) begin //data has been already set, in prev state, just assert wvalid
				     n_req_wvalid = 1'b1;
				     n_state = TOL_SLST_UPDATE;
			  end
		end
		TOL_SLST_UPDATE: begin
			  if(awready && !awvalid) begin
				     n_axireq = get_tbl_axi_wrpkt(p_tol_updpkt,p_state,tol_HT); //prepare next packet
				     n_req_awvalid = 1'b1;
				     n_state = WAIT_TOL_SLST_UPDATE;
			  end
		end
		WAIT_TOL_SLST_UPDATE: begin
			  if(wready && !wvalid) begin //data has been already set, in prev state, just assert wvalid
				     //Update SLST HEAD/TAIL
				     if(p_tol_updpkt.src_list==FREE) begin //for free list as source, it is pop_front
					n_freeListHead=p_tol_updpkt.lstEntry.next; //my next will become head 	
				     end //handle other cases later
				     n_req_wvalid = 1'b1;
				     n_state = TOL_DLST_UPDATE1;
			  end
		end
		TOL_DLST_UPDATE1: begin
			  if(awready && !awvalid) begin
				     n_axireq = get_tbl_axi_wrpkt(p_tol_updpkt,p_state,tol_HT); //prepare next packet
				     n_req_awvalid = 1'b1;
				     n_state = WAIT_TOL_DLST_UPDATE1;
			  end
		end
		WAIT_TOL_DLST_UPDATE1: begin
			  if(wready && !wvalid) begin //data has been already set, in prev state, just assert wvalid
				     //Update DLST HEAD/TAIL
					if(p_tol_updpkt.dst_list==UNCOMP) begin //for uncomp list as destination, it is push back
					   if   (uncompListTail=='d0) begin//If tail was null, update both , tail and head to first entry
					   	n_uncompListTail=p_tol_updpkt.tolEntryId; //I will become the tail	
					   	n_uncompListHead=p_tol_updpkt.tolEntryId; //I will become the head	
					   end
				        end	
				     
				     n_req_wvalid = 1'b1;
					//We need update2 for push to change
					//next of previous entry,I I am not
					//head
				     if(uncompListTail!='d0) begin
				        n_state = TOL_DLST_UPDATE2;
				     end
				     else begin
				        n_state = TBL_UPDATE_WAIT_RESP;
				     end
			  end
		end
		TOL_DLST_UPDATE2: begin
			  if(awready && !awvalid) begin
				     n_axireq = get_tbl_axi_wrpkt(p_tol_updpkt,p_state,tol_HT); //prepare next packet
				     n_req_awvalid = 1'b1;
				     n_state = WAIT_TOL_DLST_UPDATE2;
			  end
		end
		WAIT_TOL_DLST_UPDATE2: begin
			  if(wready && !wvalid) begin //data has been already set, in prev state, just assert wvalid
					if(p_tol_updpkt.dst_list==UNCOMP) begin //for uncomp list as destination, it is push back
						n_uncompListTail=p_tol_updpkt.tolEntryId; // I would become tail	
					end
				     n_req_wvalid = 1'b1;
				     n_state = TBL_UPDATE_WAIT_RESP;
			  end
		end
		TBL_UPDATE_WAIT_RESP: begin
			  if(bresp_cmplt) begin //data has been already set, in prev state, just assert wvalid
				     n_state = IDLE;
			  end
		end
	endcase
end

assign tbl_update_done = (p_state == TBL_UPDATE_WAIT_RESP) && bresp_cmplt;


//state register/output flops
always @(posedge clk_i or negedge rst_ni)
begin
	if(!rst_ni) begin
		p_state <= IDLE;
		p_etry_cnt <= 'd0;

		//Axi signals
		p_axireq.addr <= HAWK_ATT_START-64'h40; //'d0;
		p_axireq.data <= 'd0;
		p_axireq.strb <= 'd0;
		//p_axireq.bready<=1'b1;
		p_req_awvalid <= 1'b0;
		p_req_wvalid <= 1'b0;

		//Tabel update
		p_tol_updpkt <='d0;
	end
	else begin
 		p_state <= n_state;	
		p_etry_cnt <= n_etry_cnt;

		//Axi signals
		p_axireq.addr <= n_axireq.addr;
		p_axireq.data <= n_axireq.data;
		p_axireq.strb <= n_axireq.strb;
		p_req_awvalid <= n_req_awvalid ;
		p_req_wvalid <= n_req_wvalid;

		//
		//p_axireq.bready<=1'b1;

		p_tol_updpkt<=n_tol_updpkt;
	end
end
assign pgwr_mngr_ready = p_state == IDLE;

//done statuses
//later useful to map it to status register if needed
always @(posedge clk_i or negedge rst_ni)
	if(!rst_ni) begin
	  init_att_done <= 1'b0;
	  init_list_done <= 1'b0;
  	end
	else begin 
	if(n_init_att_done)
	  init_att_done <= 1'b1;
	if(n_init_list_done)
	  init_list_done <= 1'b1;
	end

//Output combo signals
assign wr_reqpkt.addr = p_axireq.addr;
assign wr_reqpkt.data = p_axireq.data;
assign wr_reqpkt.strb = p_axireq.strb;
assign wr_reqpkt.awvalid = p_req_awvalid;
assign wr_reqpkt.wvalid =  p_req_wvalid;

//Write Response are posted : Check
//For now, we support only in-order support: so no need to check ID
logic [6:0] pending_txn_cnt; //max we can have only 64 cache line in pending
logic bus_error; 
always @(posedge clk_i or negedge rst_ni) begin
	if(!rst_ni) begin
		pending_txn_cnt<='d1; //by default pending_txn_cnt is 1; so , we should never get 0, if yes, then tht is unexpected extra resp
		bus_error<=1'b0;
	end
	else begin
		if(wr_reqpkt.awvalid && wr_rdypkt.awready && wr_resppkt.bvalid && (wr_resppkt.bresp=='d0)) begin
			pending_txn_cnt<=pending_txn_cnt;
		end
		else if(wr_reqpkt.awvalid && wr_rdypkt.awready) begin
			pending_txn_cnt<=pending_txn_cnt+1;
		end
		else if(wr_resppkt.bvalid && (wr_resppkt.bresp=='d0)) begin
			pending_txn_cnt<=pending_txn_cnt-1;
		end
		if((wr_resppkt.bvalid && (wr_resppkt.bresp!='d0)) || (pending_txn_cnt=='d0))
		    bus_error<=1'b1;
	end
end
assign bresp_cmplt=pending_txn_cnt=='d1;




//ToL Head and Tails //move to separate module if required

always @(posedge clk_i or negedge rst_ni) begin
	if(!rst_ni) begin
		freeListHead<='d0; //0 corresponds for NULL
		freeListTail<='d0; 
		uncompListHead<='d0; 
		uncompListTail<='d0;
	end else begin
		freeListHead<=n_freeListHead;
		freeListTail<=n_freeListTail; 
		uncompListHead<=n_uncompListHead; 
		uncompListTail<=n_uncompListTail;
	end
end
//share with pgrd manager
assign tol_HT.freeListHead=freeListHead;
assign tol_HT.freeListTail=freeListTail;
assign tol_HT.uncompListHead=uncompListHead;
assign tol_HT.uncompListTail=uncompListTail;


//For DV
assign dump_mem = pgwr_mngr_ready;  //dump memory after operation is complete , dump mem is sensitive to only edge, we can give level signal
//
endmodule