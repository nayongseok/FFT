`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/22 19:35:46
// Design Name: 
// Module Name: Counter_UI
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


module Counter_OI(clk, start, rst_n, Overflow_Im, OI_cnt, Done);
    input clk; 
    input start;
    input rst_n;
    input Overflow_Im;
    input Done;
    reg [7:0]oi_cnt;
    output reg [7:0] OI_cnt;
    
      always@(posedge clk or negedge rst_n) begin
        if(!rst_n)     
              oi_cnt <= 8'b0;
        else if(start)
              oi_cnt <= 8'b0;
       
        
        else begin
           if(Overflow_Im) begin
                  if(oi_cnt == 8'b11111111) begin
                        oi_cnt <= 0;
                  end
                  else begin
                        oi_cnt <= oi_cnt + 1'b1; 
                  end                                         
           end        
           else begin                                     //start 신호가 1인 경우에 valid_out이 0이 되고 자연스레 초기값으로 변함.
             oi_cnt <= oi_cnt;
           end
        end
     end
     
       always@(posedge clk or negedge rst_n) begin
      if(!rst_n)
           OI_cnt <= 0;
      else if(start)
           OI_cnt <= 0;
      else begin
           if(Done)
               OI_cnt <= oi_cnt;
           else
               OI_cnt <= 0;
       end
     end
    
endmodule