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


module Counter_UR(clk, start, rst_n, Underflow_Re, UR_cnt, Done);
    input clk; 
    input start;
    input rst_n;
    input Underflow_Re;
    input Done;
    reg [7:0]ur_cnt;
    output reg [7:0] UR_cnt;
    
      always@(posedge clk or negedge rst_n) begin
        if(!rst_n)        
              ur_cnt <= 8'b0;
        else if(start)
              ur_cnt <= 8'b0;
        
        else begin
           if(Underflow_Re) begin
                  if(ur_cnt == 8'b11111111) begin
                        ur_cnt <= 0;
                  end
                  else begin
                        ur_cnt <= ur_cnt + 1'b1; 
                  end                                         
           end        
           else begin                                     //start 신호가 1인 경우에 valid_out이 0이 되고 자연스레 초기값으로 변함.
             ur_cnt <= ur_cnt;
           end
        end
     end
     
        always@(posedge clk or negedge rst_n) begin
            if(!rst_n)
                UR_cnt <= 0;
            else if(start)
                UR_cnt <= 0;
            else begin
                if(Done)
                    UR_cnt <= ur_cnt;
                else
                     UR_cnt <= 0;
            end
            end
    
endmodule