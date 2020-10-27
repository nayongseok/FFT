`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 21:53:53
// Design Name: 
// Module Name: OUTPUT_RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//module OUTPUT_RAM(
//    input clk, rst_n,
//    input [15:0] data,    //받는 데이터
//    input [7:0] addr,     //받는 데이터의 주소
//    input valid_out, valid_done,
//    input [7:0] Read_addr,
//    output [15:0] q       //읽을 때 출력값
//    );

  
//reg [15:0] ram [255:0]; 
//wire [7:0] N_addr;
//wire [1:0] N_addr_1;
//wire [1:0] N_addr_2;
//wire [1:0] N_addr_3;
//wire [1:0] N_addr_4;

//integer i;

//assign N_addr_1 = (addr[7]==addr[0]) ? {addr[7],addr[0]} : {addr[0],addr[7]};
//assign N_addr_2 = (addr[6]==addr[1]) ? {addr[6],addr[1]} : {addr[1],addr[6]};
//assign N_addr_3 = (addr[5]==addr[2]) ? {addr[5],addr[2]} : {addr[2],addr[5]};
//assign N_addr_4 = (addr[4]==addr[3]) ? {addr[4],addr[3]} : {addr[3],addr[4]};
//assign N_addr = {N_addr_1[1], N_addr_2[1], N_addr_3[1], N_addr_4[1], N_addr_4[0], N_addr_3[0], N_addr_2[0],N_addr_1[0]}; //addr[0:7];
  
//always @ (posedge clk or negedge rst_n)begin
//    if((!rst_n))begin
    
//    for(i=0; i<2**(8); i=i+1)
//            ram[i]<= 0;
    
//    end else begin
//        if(valid_out && !valid_done) 
//            ram[N_addr] <= data;
//    end
//end

//endmodule

module  OUTPUT_RAM #(
                     parameter DW = 32,
                     parameter DEPTH = 264,
                     parameter ADDR_W = $clog2 ( DEPTH )
                     )
    (
    input                            clk, rst_n, wr_en, rd_en,     //읽을지 쓸지, clk
    input          [DW-1:0]          data_in,    //받는 데이터
    input          [ADDR_W-1:0]      lft_address,
    input          [ADDR_W-1:0]      rgt_address,
    output         [DW-1:0]           data_out
    
    );


      reg  [DW-1:0]        mem_reg  [0:DEPTH-1]; 
      
      wire [DEPTH-1:0]  mem_reg_decode;
      //wire                      wr_en,rd_en;                        
      
     // assign wr_en_sig = (wr_en) && (~cs); 
      
      assign mem_reg_decode = (wr_en << lft_address); 
      
      genvar i ; 
      
      generate                          
                             
          for (i=0;i<DEPTH; i=i+1) begin : memory_block
          
        always @(posedge clk or negedge rst_n) begin
            
                    if (~rst_n)
                        mem_reg[i] <= 'd0; 
                        
                    else 
                        mem_reg[i] <= mem_reg_decode[i]?  data_in : mem_reg[i];
                        
             end        // always block 
         end        //for loop
  
       endgenerate //endgenerate block 
       
       //assign data_out = rd_en? mem_reg[address]:'d0;  
       assign data_out = (rd_en)?  mem_reg[rgt_address] : 'd0 ; 



endmodule