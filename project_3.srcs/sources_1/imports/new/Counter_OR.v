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


module Counter_OR(clk,start, rst_n, Overflow_Re, OR_cnt, Done);
    input clk; 
    input start;
    input rst_n;
    input Overflow_Re;
    input Done;
    reg [7:0] or_cnt;
    output reg [7:0] OR_cnt;
    
      always@(posedge clk or negedge rst_n) begin
        if(!rst_n)        
              or_cnt <= 8'b0;
        else if(start)
              or_cnt <= 8'b0;
        else begin
           if(Overflow_Re) begin
                  if(or_cnt == 8'b11111111) begin
                        or_cnt <= 0;
                  end
                  else begin
                        or_cnt <= or_cnt + 1'b1; 
                  end                                         
           end        
           else begin                                     //start 신호가 1인 경우에 valid_out이 0이 되고 자연스레 초기값으로 변함.
             or_cnt <= or_cnt;
           end
        end
     end
     
        always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            OR_cnt <= 0;
        else if(start)
            OR_cnt <= 0;
        else begin
            if(Done)
                OR_cnt <= or_cnt;
            else
                 OR_cnt <= 0;
        end
        end
     
     
    
endmodule