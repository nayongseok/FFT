`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 16:40:40
// Design Name: 
// Module Name: INPUT_RAM
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

//module INPUT_RAM#(
//parameter In_BW = 12)
//    (
//    input clk, rst_n, start,
//    input [In_BW-1:0] data,    //받는 데이터
//    input [7:0] addr,     //받는 데이터의 주소
//    input valid_in,//
//    input stop,
//    output [11:0] sample_data       //읽을 때 출력값
//    );

//reg [15:0] ram [255:0];

//integer i;

//always @ (posedge clk or negedge rst_n)begin

//    if((!rst_n)||(start==1'b1))begin
    
//    for(i=0; i<2**(8); i=i+1)
//            ram[i]<= 0;
    
//    end else begin
//        if(valid_in)begin
//            ram[addr] <= data;
//            if(stop)begin
//                for(i=0; i<2**(8); i=i+1)
//                        ram[i]<= 0;
//            end
//        end
//    end
//end

//assign sample_data = ram[addr];

//endmodule

module INPUT_RAM #(
                   parameter DW = 32,
                   parameter DEPTH = 256,
                   parameter ADDR_W = $clog2 ( DEPTH )

                   )
    (
    input                            clk,rst_n,wr_en,rd_en,       //읽을지 쓸지, clk
    input          [DW-1:0]          data_in,
    input          [ADDR_W-1:0]      lft_address,
    input          [ADDR_W-1:0]      rgt_address,
    output         [DW-1:0]          data_out,
    output         [DW-1:0]          spi_data_out,
    input                            spi_rd_en
    );
    
reg  [DW-1:0]        mem_reg  [0:DEPTH]; 
//reg  [DW-1:0] mem_reg_F [0:DEPTH]; 

wire [DEPTH-1:0]  mem_reg_decode;
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
  
  
//          always @(posedge clk or negedge rst_n) begin
    
//            if (~rst_n)
//                mem_reg_F[i] <= 'd0; 
                
//            else begin
//                mem_reg_F[i] <= mem_reg_decode[i]?  data_in : mem_reg_F[i];
//                 mem_reg[i] <=  mem_reg_F[i];
//              end
//             end        // always block 
//             end
     
endgenerate //endgenerate block 
       
       //assign data_out = rd_en? mem_reg[address]:'d0;  
assign data_out = (rd_en)?  mem_reg[rgt_address] : 'd0 ; 
assign spi_data_out = (spi_rd_en) ? mem_reg[lft_address] : 'd0 ;


endmodule
