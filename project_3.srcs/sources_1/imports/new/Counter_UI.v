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


module Counter_UI(clk, start, rst_n, Underflow_Im, UI_cnt, Done);
    input clk; 
    input start;
    input rst_n;
    input Underflow_Im;
    input Done;
    reg [7:0] ui_cnt;
    output reg [7:0] UI_cnt;
    
      always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
              ui_cnt <= 8'b0;
        else if(start)
              ui_cnt <= 8'b0;
              
        else begin
           if(Underflow_Im) begin
                  if(ui_cnt == 8'b11111111) begin
                        ui_cnt <= 0;
                  end
                  else begin
                        ui_cnt <= ui_cnt + 1'b1; 
                  end                                         
           end        
           else begin                                     //start 신호가 1인 경우에 valid_out이 0이 되고 자연스레 초기값으로 변함.
             ui_cnt <= ui_cnt;
           end
        end
     end
     
          
     always@(posedge clk or negedge rst_n) begin
                 if(!rst_n)
                     UI_cnt <= 0;
                 else if(start)
                     UI_cnt <= 0;
                 else begin
                     if(Done)
                         UI_cnt <= ui_cnt;
                     else
                          UI_cnt <= 0;
                 end
                 end
    
endmodule
