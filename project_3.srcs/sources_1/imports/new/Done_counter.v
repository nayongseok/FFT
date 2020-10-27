`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/22 16:30:34
// Design Name: 
// Module Name: Done_counter
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

module Done_counter # (parameter Cnt = 8)
   (clk, rst_n, valid_out, done_cnt);//start_d,
    input clk;
    input rst_n;
    input valid_out; //valid input
    output reg [Cnt:0] done_cnt;
  
    
   always@(posedge clk or negedge rst_n) begin
      if(!rst_n) begin      
            done_cnt <= 0;
      end
      
      else begin
         if(valid_out) begin//start_d &&  
                if(done_cnt == {(Cnt+1'b1){1'b1}}) begin
                      done_cnt <= 0;
                end
                else begin
                        done_cnt <= done_cnt + 1'b1;         
               end
          end        
         else begin                                     
            done_cnt <= done_cnt;   
         end
      end
   end
endmodule
