`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 20:46:20
// Design Name: 
// Module Name: Start_counter
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


module Start_counter # (parameter Cnt = 8)
   (clk, rst_n, valid_in, cnt_start);//start_d,
    input clk;
    input rst_n;
    input valid_in; //valid input
    output reg [Cnt-1:0] cnt_start;
    
   always@(posedge clk or negedge rst_n) begin
      if(!rst_n) begin     
            cnt_start <= 0;
      end
      
      else begin
         if(valid_in) begin//start_d &&  
            if(cnt_start == {(Cnt){1'b1}}) begin
                      cnt_start <= cnt_start;
                end
                else begin
                       cnt_start <= cnt_start + 1'b1;         
               end
          end        
         else begin                                     
            cnt_start <= 0;   
         end                       
      end
   end
endmodule

