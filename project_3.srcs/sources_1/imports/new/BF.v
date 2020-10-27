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
module BF(Gr,Gi,Hr,Hi,Xr,Xi,Yr,Yi);

parameter BW = 12;

input signed  [BW-1:0] Gr,Gi,Hr,Hi;
output signed [BW:0]   Xr,Xi,Yr,Yi;
//input BF_en;

assign Xr = Gr+Hr; //mult_
assign Xi = Gi+Hi;
assign Yr = Gr-Hr; //mult_real = mult_re_re - mult_im_im
assign Yi = Gi-Hi; //mult_imag = mult_re_im -

endmodule