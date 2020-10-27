`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/23 21:22:39
// Design Name: 
// Module Name: FPGA_TOP
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


module FPGA_TOP#(parameter In_BW =12
            )(
           input clk,
           input reset,
           input valid_in,
           input start,
           input MOSI,
           input SCK,
           input nSS,
           output MISO,
           output Done_FFT
           );
           
           wire rst_n;
           assign rst_n = reset;
           
     
           TOP_3 TOP_3(
                       .clk(clk),
                       .rst_n(rst_n),
                       .valid_in(valid_in),
                       .start(start),
                       .MOSI(MOSI),
                       .SCK(SCK),
                       .nSS(nSS),
                       .MISO(MISO),
                       .Done_FFT(Done_FFT)
          
                      );

   
endmodule

