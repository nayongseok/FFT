`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:21 05/30/2019 
// Design Name: 
// Module Name:    BF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BF_Fin(Gr,Gi,Hr,Hi,Xr,Xi,Yr,Yi,Overflow_Re,Overflow_Im,Underflow_Re,Underflow_Im);

parameter BW = 12;

input signed  [BW-1:0] Gr,Gi,Hr,Hi;
output signed [BW:0]   Xr,Xi,Yr,Yi;

      output wire Overflow_Re;
      output wire Overflow_Im;
      output wire Underflow_Re;
      output wire Underflow_Im;
//input BF_en;

assign Xr = Gr+Hr; //mult_
assign Xi = Gi+Hi;
assign Yr = Gr-Hr; //mult_real = mult_re_re - mult_im_im
assign Yi = Gi-Hi; //mult_imag = mult_re_im -

//assign Overflow_Re = (Gr[BW-1]== 0 && Hr[BW-1]== 1 && Xr[BW] == 1)? 1 : 0; //r+r =r
//assign Overflow_Im = (Gi[BW-1]== 0 && Hi[BW-1]== 0 && Xi[BW] == 1)? 1 : 0;
//assign Underflow_Re = (Gr[BW-1]== 1 && Hr[BW-1]== 0 && Yr[BW] == 0)? 1 : 0; //r-r =r
//assign Underflow_Im = (Gi[BW-1]== 1 && Hi[BW-1]== 1 && Yi[BW] == 0)? 1 : 0;

assign Overflow_Re = (Gr[BW-1]== 0 && Hr[BW-1]== 0 && Xr[BW] == 1)? 1 : 0; //r+r =r
assign Overflow_Im = (Gi[BW-1]== 0 && Hi[BW-1]== 0 && Xi[BW] == 1)? 1 : 0;
assign Underflow_Re = (Gr[BW-1]== 1 && Hr[BW-1]== 0 && Yr[BW] == 0)? 1 : 0; 
assign Underflow_Im = (Gi[BW-1]== 1 && Hi[BW-1]== 0 && Yi[BW] == 0)? 1 : 0;
endmodule
