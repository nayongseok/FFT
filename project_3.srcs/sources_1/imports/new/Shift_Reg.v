`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:04 05/30/2019 
// Design Name: 
// Module Name:    Shift_Reg 
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
module Shift_Reg #( parameter BW = 12,
					parameter N = 4 
				  )
	(
		input clk,
		input rst_n,
		input signed [BW:0] inData,
		input valid,
		output signed [BW:0] outData
    );
	// reg signed [BW:0] sr_in;
//	 reg  signed [BW:0] reg_Data;
//     reg  signed [BW:0] reg_Data_2;
////	 reg  signed [BW:0] outData_2;
	 reg signed [BW:0] sr[N-1:0];
	 integer i;
	 //buffer
//	 always@(posedge clk or negedge rst_n) begin
//            if(!rst_n)
//                sr_in <= 0;
//            else if(valid)
//                sr_in <= inData;
//     end
     
	 always@(posedge clk or negedge rst_n) begin
	  if(!rst_n)
		for(i=1; i<N; i=i+1)
			sr[i]<=0;
	  else if(valid) begin
		for(i=1; i<N; i=i+1)
			sr[i]<=sr[i-1];
	  end 
	 end
	 
	 always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			sr[0] <= 0;
		else if(valid)
			sr[0] <= inData;
	 end
//     always@(posedge clk or negedge rst_n) begin
  
//               reg_Data <= sr[N-1];
////               reg_Data_2 <= reg_Data;
//         end
assign outData = sr[N-1];

endmodule
