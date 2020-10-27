`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:11 05/30/2019 
// Design Name: 
// Module Name:    MULT 
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
module MULT #( parameter BW = 12,
               parameter N =4,
               parameter Cnt = 8,
               parameter TF_Width = 16)
   (    
//      input clk,rst_n,
      input signed [BW:0] inData_re,
      input signed [BW:0] inData_im,
      input [Cnt-1:0]cnt,
      
      output wire signed [BW:0] outData_re,
      output wire signed [BW:0] outData_im,
  
      output wire Overflow_Re,
      output wire Overflow_Im,
      output wire Underflow_Re,
      output wire Underflow_Im
    );
//    reg signed [BW:0] inData_re_reg;
//    reg signed [BW:0] inData_im_reg;
    reg [Cnt-1:0]count;
    wire signed [TF_Width-1:0] tmp_TF_Real;
    wire signed [TF_Width-1:0] tmp_TF_Imag;
     
    wire signed [(BW+TF_Width-1):0] mult_Re_Re;
    wire signed [(BW+TF_Width-1):0] mult_Re_Im;
    wire signed [(BW+TF_Width-1):0] mult_Im_Re;
    wire signed [(BW+TF_Width-1):0] mult_Im_Im;


   wire signed [(BW+TF_Width-1):0] mult_Real;
   wire signed [(BW+TF_Width-1):0] mult_Imag;
//   wire signed [(BW+TF_Width-1):0] result_Real;
//   wire signed [(BW+TF_Width-1):0] result_Imag;
    
    ROM_Twiddle_Factor #(.Cnt(Cnt)) ROM_Twiddle_Factor(.Addr(count), .Twiddle_Real(tmp_TF_Real), .Twiddle_Imag(tmp_TF_Imag));
    
    
    always@(cnt) begin
      if (N==128)
          count <= {cnt[7:0]-3'd1};//-3'd1 twiddlefactor? ?? ??? ?
      else if (N==64)
          count <= {{cnt[6:0]-3'd2},1'b0};
      else if (N==32)
           count <= {{cnt[5:0]-3'd3},2'b00};
       else if (N==16)
            count <= {{cnt[4:0]-3'd4},3'b000};
       else if (N==8)
            count <= {{cnt[3:0]-3'd5},4'b0000};
       else if (N==4)
             count <= {{cnt[2:0]-3'd6},5'b00000};
       else if (N==2)
             count <= {{cnt[1:0]-3'd7},6'b000000};
     end
   
     
   assign mult_Re_Re = inData_re * tmp_TF_Real; //real
   assign mult_Re_Im = inData_re * tmp_TF_Imag; //imag
   assign mult_Im_Re = inData_im * tmp_TF_Real; //imag
   assign mult_Im_Im = inData_im * tmp_TF_Imag; //real
   
   assign mult_Real = mult_Re_Re - mult_Im_Im;
   assign mult_Imag = mult_Re_Im + mult_Im_Re;
   
   assign Overflow_Re = (mult_Re_Re[BW+TF_Width-1]== 0 && mult_Im_Im[BW+TF_Width-1]== 1 && mult_Real[BW+TF_Width-1] == 1)? 1 : 0;
   assign Overflow_Im = (mult_Re_Im[BW+TF_Width-1]== 0 && mult_Im_Re[BW+TF_Width-1]== 0 && mult_Imag[BW+TF_Width-1] == 1)? 1 : 0;
   assign Underflow_Re = (mult_Re_Re[BW+TF_Width-1]== 1 && mult_Im_Im[BW+TF_Width-1]== 0 && mult_Real[BW+TF_Width-1] == 0)? 1 : 0;
   assign Underflow_Im = (mult_Re_Im[BW+TF_Width-1]== 1 && mult_Im_Re[BW+TF_Width-1]== 1 && mult_Imag[BW+TF_Width-1] == 0)? 1 : 0;
   
   assign outData_re = mult_Real[(BW+TF_Width-1) : TF_Width-1];  // [(BW+TF_Width-1) : TF_Width-1]27:15
   assign outData_im = mult_Imag[(BW+TF_Width-1) : TF_Width-1];

   //   assign re_out = result_Real;//mult_Real;
   //   assign im_out = result_Imag;//mult_Imag;

//assign re_out = result_Real;//mult_Real;
//assign im_out = result_Imag;//mult_Imag;

//always@(posedge clk or negedge rst_n) begin
//if(!rst_n) begin
//    inData_re_reg <= 0;
//    inData_im_reg <= 0;
//    end
// else begin
//      inData_re_reg <= inData_re;
//      inData_im_reg <= inData_im;
//      end
//end
   
endmodule