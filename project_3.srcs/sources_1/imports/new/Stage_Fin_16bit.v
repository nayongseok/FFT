`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:55:23 05/31/2019 
// Design Name: 
// Module Name:    Stage_Fin 
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
module Stage_Fin #(parameter BW=12,
				   parameter N=1,
				   parameter Cnt = 8
						)
	(clk, start, rst_n, bf_en,valid,sample_re_data, sample_im_data,re_data,im_data, Flow_cnt, Done);
	
input clk, start, rst_n, bf_en;
input signed [BW-1:0] sample_re_data, sample_im_data;
input valid;
input Done;
output wire signed[BW:0] re_data,im_data;

 wire Overflow_Re;
 wire Overflow_Im;
 wire Underflow_Re;
 wire Underflow_Im;

 output [31:0]Flow_cnt;


reg [BW-1:0] rReal, rImag;
wire signed [BW:0] bf_x[1:0];
wire signed [BW:0] bf_y[1:0];
//wire [BW:0] mult_out[1:0];
reg signed [BW:0] sr_out_re;
reg signed [BW:0] sr_out_im;

wire signed [BW:0] mux0 [1:0];
wire signed [BW:0] mux1 [1:0];

wire  [7:0]OR_cnt;
wire  [7:0]OI_cnt;
wire  [7:0]UR_cnt;
wire  [7:0]UI_cnt;

/*
assign rReal = {sample_re_data[BW-1],sample_re_data};
assign rImag = {sample_im_data[BW-1],sample_im_data};
*/

assign mux0[0] = bf_en ? bf_x[0] : sr_out_re;  //Xr add
assign mux0[1] = bf_en ? bf_x[1] : sr_out_im;  //Xi add

assign mux1[0] = bf_en ? bf_y[0] : {rReal[BW-1],rReal};  //Yr sub
assign mux1[1] = bf_en ? bf_y[1] : {rImag[BW-1],rImag};  //Yi sub

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		sr_out_re <= 0;
	else begin
		if(valid)
		  sr_out_re <= mux1[0];
	end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		sr_out_im <= 0;
	else begin
		if(valid)
		  sr_out_im <=  mux1[1];
end
end

BF_Fin #(BW) BF_Fin({sr_out_re[BW-1:0]},{sr_out_im[BW-1:0]},{rReal}, {rImag}, bf_x[0], bf_x[1], bf_y[0], bf_y[1],Overflow_Re,Overflow_Im,Underflow_Re,Underflow_Im);

assign re_data = mux0[0];  //앞의 0을 나타내는 MSB를 잘라낸다.
assign im_data = mux0[1];
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

Counter_OR Counter_OR(.clk(clk), .start(start), .rst_n(rst_n), .Overflow_Re(Overflow_Re), .OR_cnt(OR_cnt[7:0]), .Done(Done));
Counter_OI Counter_OI(.clk(clk), .start(start), .rst_n(rst_n), .Overflow_Im(Overflow_Im), .OI_cnt(OI_cnt[7:0]), .Done(Done));
Counter_UR Counter_UR(.clk(clk), .start(start), .rst_n(rst_n), .Underflow_Re(Underflow_Re), .UR_cnt(UR_cnt[7:0]), .Done(Done));
Counter_UI Counter_UI(.clk(clk), .start(start), .rst_n(rst_n), .Underflow_Im(Underflow_Im), .UI_cnt(UI_cnt[7:0]), .Done(Done));

//   always@(*) begin
//       if(!rst_n) begin
//            OR_cnt_out = 0;   ///////overflow 갯수
//            OI_cnt_out = 0;
//            UR_cnt_out = 0;
//            UI_cnt_out = 0;
//       end
//       else if(Done) begin
//                OR_cnt_out = OR_cnt;   ///////overflow 갯수
//                OI_cnt_out = OI_cnt;
//                UR_cnt_out = UR_cnt;
//                UI_cnt_out = UI_cnt;
//            end
//            else begin
//                OR_cnt_out = 0;   ///////overflow 갯수
//                OI_cnt_out = 0;
//                UR_cnt_out = 0;
//                UI_cnt_out = 0;
//            end  
//   end

assign Flow_cnt[31:0] ={OR_cnt,OI_cnt,UR_cnt,UI_cnt};

endmodule
