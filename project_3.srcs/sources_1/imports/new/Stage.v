`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:03 05/29/2019 
// Design Name: 
// Module Name:    Stage 
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
module Stage #( parameter BW = 12,
              // cnt=5;
				parameter N = 4,
				parameter Cnt = 8
					)
( clk, rst_n, start, bf_en, cnt, valid, sample_re_data, sample_im_data, re_data, im_data, Flow_cnt, Done);

input clk; 
input rst_n;
input start;
input bf_en;
input valid;
input Done;
input [Cnt-1 : 0] cnt;

input signed [BW-1:0] sample_re_data;
input signed [BW-1:0] sample_im_data;

output wire signed [BW:0] re_data;
output wire signed [BW:0] im_data;

 wire Overflow_Re;
 wire Overflow_Im;
 wire Underflow_Re;
 wire Underflow_Im;

output [31:0] Flow_cnt;

wire  [7:0]OR_cnt; 
wire  [7:0]OI_cnt;
wire  [7:0]UR_cnt;
wire  [7:0]UI_cnt;

reg [BW-1:0] rReal, rImag;

wire signed [BW:0] bf_x[1:0];
wire signed [BW:0] bf_y[1:0];

wire signed [BW:0] mult_out[1:0];
wire signed [BW:0] sr_out[1:0];
//reg signed [BW:0] sr_reg [1:0];
wire signed [BW:0] mux0 [1:0];
wire signed [BW:0] mux1 [1:0];

wire signed [BW:0]result_Real;
wire signed [BW:0]result_Imag;
/*
assign rReal = {sample_re_data[BW-1],sample_re_data};
assign rImag = {sample_im_data[BW-1],sample_im_data};
*/
////////////////////////////////////////////////////////////////////////
//always@(posedge clk or negedge rst_n) begin
//   if(!rst_n) begin
//    sr_reg[0]<=0;
//    sr_reg[1]<=0;
//   end
//   else begin
//      if(valid) begin
//         sr_reg[0]<=sr_out[0];
//         sr_reg[1]<=sr_out[1];
//      end
//   end
//end
////////////////////////////////////////////////////////////////////////////


assign mux0[0] = bf_en ? bf_x[0] : sr_out[0];  //Xr add
assign mux0[1] = bf_en ? bf_x[1] : sr_out[1];  //Xi add

assign mux1[0] = bf_en ? bf_y[0] : {rReal[BW-1],rReal};  //Yr sub
assign mux1[1] = bf_en ? bf_y[1] : {rImag[BW-1],rImag};  //Yi sub

Shift_Reg #(BW,N) SR0(clk,rst_n,mux1[0],valid,sr_out[0]); //real
Shift_Reg #(BW,N) SR1(clk,rst_n,mux1[1],valid,sr_out[1]); //imagine
BF #(BW) BF0({sr_out[0][BW-1:0]},{sr_out[1][BW-1:0]},{rReal}, {rImag}, bf_x[0], bf_x[1], bf_y[0], bf_y[1]);
MULT #(.BW(BW),.N(N), .Cnt(Cnt)) MULT0(mux0[0],mux0[1],cnt[Cnt-1:0],mult_out[0],mult_out[1], Overflow_Re, Overflow_Im, Underflow_Re, Underflow_Im);

Counter_OR Counter_OR(.clk(clk), .start(start), .rst_n(rst_n), .Overflow_Re(Overflow_Re), .OR_cnt(OR_cnt[7:0]), .Done(Done));
Counter_OI Counter_OI(.clk(clk), .start(start), .rst_n(rst_n), .Overflow_Im(Overflow_Im), .OI_cnt(OI_cnt[7:0]), .Done(Done));
Counter_UR Counter_UR(.clk(clk), .start(start), .rst_n(rst_n), .Underflow_Re(Underflow_Re), .UR_cnt(UR_cnt[7:0]), .Done(Done));
Counter_UI Counter_UI(.clk(clk), .start(start), .rst_n(rst_n), .Underflow_Im(Underflow_Im), .UI_cnt(UI_cnt[7:0]), .Done(Done));

assign re_data = bf_en ? mux0[0] : result_Real; //mult_out[0]
assign im_data = bf_en ? mux0[1] : result_Imag; // mult_out[1]

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
	  rReal <= 0;
	  rImag <= 0;
	end
	else if(valid) begin
		
	  rReal <= sample_re_data;
	  rImag <= sample_im_data;

	end
end

   assign result_Real = (Overflow_Re == 1'b1) ? {{1'b0},{(BW){1'b1}}} : (Underflow_Re == 1'b1) ? {{1'b1},{(BW-1){1'b0}},{1'b1}} : mult_out[0];
   assign result_Imag = (Overflow_Im == 1'b1) ? {{1'b0},{(BW){1'b1}}} : (Underflow_Im == 1'b1) ? {{1'b1},{(BW-1){1'b0}},{1'b1}} : mult_out[1];  // stage ¿¡¼­
   
//   always@(*) begin
//       if(!rst_n) begin
//            OR_cnt_out = 0;   ///////overflow °¹¼ö
//            OI_cnt_out = 0;
//            UR_cnt_out = 0;
//            UI_cnt_out = 0;
//       end
//       else if(Done) begin
//                OR_cnt_out = OR_cnt;   ///////overflow °¹¼ö
//                OI_cnt_out = OI_cnt;
//                UR_cnt_out = UR_cnt;
//                UI_cnt_out = UI_cnt;
//            end
//            else begin
//                OR_cnt_out = 0;   ///////overflow °¹¼ö
//                OI_cnt_out = 0;
//                UR_cnt_out = 0;
//                UI_cnt_out = 0;
//            end  
//   end

    assign Flow_cnt [31:0] = {OR_cnt,OI_cnt,UR_cnt,UI_cnt};

endmodule
