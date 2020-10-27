//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date:    05:40:51 05/31/2019 
//// Design Name: 
//// Module Name:    ROM_Twiddle_Factor 
//// Project Name: 
//// Target Devices: 
//// Tool versions: 
//// Description: 
////
//// Dependencies: 
////
//// Revision: 
//// Revision 0.01 - File Created
//// Additional Comments: 
////
////////////////////////////////////////////////////////////////////////////////////
//module ROM_Twiddle_Factor(Addr, Twiddle_Real, Twiddle_Imag
//    );
//	parameter Cnt = 8; 
//	parameter TF_Width = 16;
	
//	input [Cnt-1:0] Addr;
//	output reg signed [TF_Width-1:0] Twiddle_Real;
//	output reg signed [TF_Width-1:0] Twiddle_Imag; 
	
//	always@(*) begin
//		case(Addr)
//			8'd0 : Twiddle_Real = $signed(16'b0111_1111_1111_1111 ); 
//			8'd1 : Twiddle_Real = $signed(16'b0111_1111_1111_0110 );
//			8'd2 : Twiddle_Real = $signed(16'b0111_1111_1101_1000 );
//			8'd3 : Twiddle_Real = $signed(16'b0111_1111_1010_0111 );
//			8'd4 : Twiddle_Real = $signed(16'b0111_1111_0110_0010 );
//			8'd5 : Twiddle_Real = $signed(16'b0111_1111_0000_1010 );
//			8'd6 : Twiddle_Real = $signed(16'b0111_1110_1001_1110 );  
//			8'd7 : Twiddle_Real = $signed(16'b0111_1110_0001_1100 ); 
//			8'd8 : Twiddle_Real = $signed(16'b0111_1101_1000_1010 ); 
//			8'd9 : Twiddle_Real = $signed(16'b0111_1100_1110_0011 ); 
//			8'd10 : Twiddle_Real = $signed(16'b0111_1100_0010_1000 ); 
//			8'd11 : Twiddle_Real = $signed(16'b0111_1011_0101_1101 ); 
//			8'd12 : Twiddle_Real = $signed(16'b0111_1010_0111_1011 ); 
//			8'd13 : Twiddle_Real = $signed(16'b0111_1001_1000_1001 ); 
//			8'd14 : Twiddle_Real = $signed(16'b0111_1000_1000_0011 ); 
//			8'd15 : Twiddle_Real = $signed(16'b0111_0111_0110_1100 ); 
//			8'd16 : Twiddle_Real = $signed(16'b0111_0110_0100_0010 ); 
//			8'd17 : Twiddle_Real = $signed(16'b0111_0101_0000_0100 ); 
//			8'd18 : Twiddle_Real = $signed(16'b0111_0011_1011_0110 );
//			8'd19 : Twiddle_Real = $signed(16'b0111_0010_0101_0100 ); 
//			8'd20 : Twiddle_Real = $signed(16'b0111_0000_1110_0010 ); 
//			8'd21 : Twiddle_Real = $signed(16'b0110_1111_0101_1111 ); 
//			8'd22 : Twiddle_Real = $signed(16'b0110_1101_1100_1001 );   
//			8'd23 : Twiddle_Real = $signed(16'b0110_1100_0010_0101 ); 
//			8'd24 : Twiddle_Real = $signed(16'b0110_1010_0110_1110 ); 
//			8'd25 : Twiddle_Real = $signed(16'b0110_1000_1010_0111 ); 
//			8'd26 : Twiddle_Real = $signed(16'b0110_0110_1100_1111 ); 
//			8'd27 : Twiddle_Real = $signed(16'b0110_0100_1110_0111 ); 
//			8'd28 : Twiddle_Real = $signed(16'b0110_0010_1111_0001 ); 
//			8'd29 : Twiddle_Real = $signed(16'b0110_0000_1110_1011 ); 
//			8'd30 : Twiddle_Real = $signed(16'b0101_1110_1101_1001 );
//			8'd31 : Twiddle_Real = $signed(16'b0101_1100_1011_0010 );
//			8'd32 : Twiddle_Real = $signed(16'b0101_1010_1000_0010 ); 
//			8'd33 : Twiddle_Real = $signed(16'b0101_1000_0100_0001 ); 
//			8'd34 : Twiddle_Real = $signed(16'b0101_0101_1111_0111 ); 
//			8'd35 : Twiddle_Real = $signed(16'b0101_0011_1001_1100 ); 
//			8'd36 : Twiddle_Real = $signed(16'b0101_0001_0011_0100 ); 
//			8'd37 : Twiddle_Real = $signed(16'b0100_1110_1011_1110 ); 
//			8'd38 : Twiddle_Real = $signed(16'b0100_1100_0011_1111 ); 
//			8'd39 : Twiddle_Real = $signed(16'b0100_1001_1011_0011 ); 
//			8'd40 : Twiddle_Real = $signed(16'b0100_0111_0001_1101 ); 
//			8'd41 : Twiddle_Real = $signed(16'b0100_0100_0111_1010 ); 
//			8'd42 : Twiddle_Real = $signed(16'b0100_0001_1100_1110 ); 
//			8'd43 : Twiddle_Real = $signed(16'b0011_1111_0001_0111 ); 
//			8'd44 : Twiddle_Real = $signed(16'b0011_1100_0101_0110 ); 
//			8'd45 : Twiddle_Real = $signed(16'b0011_1001_1000_1100 ); 
//			8'd46 : Twiddle_Real = $signed(16'b0011_0110_1011_1011 ); 
//			8'd47 : Twiddle_Real = $signed(16'b0011_0011_1101_1101 ); 
//			8'd48 : Twiddle_Real = $signed(16'b0011_0000_1111_1100 ); 
//			8'd49 : Twiddle_Real = $signed(16'b0010_1110_0001_0001 ); 
//			8'd50 : Twiddle_Real = $signed(16'b0010_1011_0001_1111 ); 
//			8'd51 : Twiddle_Real = $signed(16'b0010_1000_0010_0111 ); 
//			8'd52 : Twiddle_Real = $signed(16'b0010_0101_0010_1000 ); 
//			8'd53 : Twiddle_Real = $signed(16'b0010_0010_0010_0011 ); 
//			8'd54 : Twiddle_Real = $signed(16'b0001_1111_0001_1000 ); 
//			8'd55 : Twiddle_Real = $signed(16'b0001_1100_0000_1011 ); 
//			8'd56 : Twiddle_Real = $signed(16'b0001_1000_1111_1001 ); 
//			8'd57 : Twiddle_Real = $signed(16'b0001_0101_1110_0011 ); 
//			8'd58 : Twiddle_Real = $signed(16'b0001_0010_1100_0111 ); 
//			8'd59 : Twiddle_Real = $signed(16'b0000_1111_1010_1010 ); 
//			8'd60 : Twiddle_Real = $signed(16'b0000_1100_1000_1011 ); 
//			8'd61 : Twiddle_Real = $signed(16'b0000_1001_0110_1011 );  
//			8'd62 : Twiddle_Real = $signed(16'b0000_0110_0100_1000 ); 
//			8'd63 : Twiddle_Real = $signed(16'b0000_0011_0010_0010 ); 
//			8'd64 : Twiddle_Real = $signed(16'b0000_0000_0000_0000 );
//			8'd65 : Twiddle_Real = $signed(16'b1111_1100_1101_1110 ); 
//			8'd66 : Twiddle_Real = $signed(16'b1111_1001_1011_1000 ); 
//			8'd67 : Twiddle_Real = $signed(16'b1111_0110_1001_0101 ); 
//			8'd68 : Twiddle_Real = $signed(16'b1111_0011_0111_0101 ); 
//			8'd69 : Twiddle_Real = $signed(16'b1111_0000_0101_0110 ); 
//			8'd70 : Twiddle_Real = $signed(16'b1110_1101_0011_1001 ); 
//			8'd71 : Twiddle_Real = $signed(16'b1110_1010_0001_1101 ); 
//			8'd72 : Twiddle_Real = $signed(16'b1110_0111_0000_0111 ); 
//			8'd73 : Twiddle_Real = $signed(16'b1110_0011_1111_0101 ); 
//			8'd74 : Twiddle_Real = $signed(16'b1110_0000_1110_0110 );
//			8'd75 : Twiddle_Real = $signed(16'b1101_1101_1101_1101 ); 
//			8'd76 : Twiddle_Real = $signed(16'b1101_1010_1101_1000 ); 
//			8'd77 : Twiddle_Real = $signed(16'b1101_0111_1101_1001 ); 
//			8'd78 : Twiddle_Real = $signed(16'b1101_0100_1110_0001 ); 
//			8'd79 : Twiddle_Real = $signed(16'b1101_0001_1110_1111 ); 
//			8'd80 : Twiddle_Real = $signed(16'b1100_1111_0000_0100 ); 
//			8'd81 : Twiddle_Real = $signed(16'b1100_1100_0010_0011 ); 
//			8'd82 : Twiddle_Real = $signed(16'b1100_1001_0100_0110 ); 
//			8'd83 : Twiddle_Real = $signed(16'b1100_0110_0111_0100 ); 
//			8'd84 : Twiddle_Real = $signed(16'b1100_0011_1010_1010 ); 
//			8'd85 : Twiddle_Real = $signed(16'b1100_0000_1110_1001 ); 
//			8'd86 : Twiddle_Real = $signed(16'b1011_1110_0011_0010 ); 
//			8'd87 : Twiddle_Real = $signed(16'b1011_1011_1000_0110 );
//			8'd88 : Twiddle_Real = $signed(16'b1011_1000_1110_0011 ); 
//			8'd89 : Twiddle_Real = $signed(16'b1011_0110_0100_1101 ); 
//			8'd90 : Twiddle_Real = $signed(16'b1011_0011_1100_0001 ); 
//			8'd91 : Twiddle_Real = $signed(16'b1011_0001_0100_0010 ); 
//			8'd92 : Twiddle_Real = $signed(16'b1010_1110_1100_1100 ); 
//			8'd93 : Twiddle_Real = $signed(16'b1010_1100_0110_0100 );
//			8'd94 : Twiddle_Real = $signed(16'b1010_1010_0000_1001 ); 
//			8'd95 : Twiddle_Real = $signed(16'b1010_0111_1011_1111 ); 
//			8'd96 : Twiddle_Real = $signed(16'b1010_0101_0111_1110 ); 
//			8'd97 : Twiddle_Real = $signed(16'b1010_0011_0100_1110 );
//			8'd98 : Twiddle_Real = $signed(16'b1010_0001_0010_0111 ); 
//			8'd99 : Twiddle_Real = $signed(16'b1001_1111_0001_0101 );
//			8'd100 : Twiddle_Real = $signed(16'b1001_1101_0000_1111 ); 
//			8'd101 : Twiddle_Real = $signed(16'b1001_1011_0001_1001 );
//			8'd102 : Twiddle_Real = $signed(16'b1001_1001_0011_0001 );
//			8'd103 : Twiddle_Real = $signed(16'b1001_0111_0101_1001 ); 
//			8'd104 : Twiddle_Real = $signed(16'b1001_0101_1001_0010 ); 
//			8'd105 : Twiddle_Real = $signed(16'b1001_0011_1101_1011 );
//			8'd106 : Twiddle_Real = $signed(16'b1001_0010_0011_0111 ); 
//			8'd107 : Twiddle_Real = $signed(16'b1001_0000_1010_0001 ); 
//			8'd108 : Twiddle_Real = $signed(16'b1000_1111_0001_1110 ); 
//			8'd109 : Twiddle_Real = $signed(16'b1000_1101_1010_1100 ); 
//			8'd110 : Twiddle_Real = $signed(16'b1000_1100_0100_1010 ); 
//			8'd111 : Twiddle_Real = $signed(16'b1000_1010_1111_1100 ); 
//			8'd112 : Twiddle_Real = $signed(16'b1000_1001_1011_1110 ); 
//			8'd113 : Twiddle_Real = $signed(16'b1000_1000_1001_0100 ); 
//			8'd114 : Twiddle_Real = $signed(16'b1000_0111_0111_1101 ); 
//			8'd115 : Twiddle_Real = $signed(16'b1000_0110_0111_0111 ); 
//			8'd116 : Twiddle_Real = $signed(16'b1000_0101_1000_0101 ); 
//			8'd117 : Twiddle_Real = $signed(16'b1000_0100_1010_0011 ); 
//			8'd118 : Twiddle_Real = $signed(16'b1000_0011_1101_1000 ); 
//			8'd119 : Twiddle_Real = $signed(16'b1000_0011_0001_1101 ); 
//			8'd120 : Twiddle_Real = $signed(16'b1000_0010_0111_0110 ); 
//			8'd121 : Twiddle_Real = $signed(16'b1000_0001_1110_0010 ); 
//			8'd122 : Twiddle_Real = $signed(16'b1000_0001_0110_0010 ); 
//			8'd123 : Twiddle_Real = $signed(16'b1000_0000_1111_0110 );
//			8'd124 : Twiddle_Real = $signed(16'b1000_0000_1001_1110 ); 
//			8'd125 : Twiddle_Real = $signed(16'b1000_0000_0101_1001 );
//			8'd126 : Twiddle_Real = $signed(16'b1000_0000_0010_1000 ); 
//			8'd127 : Twiddle_Real = $signed(16'b1000_0000_0000_1010 );
//			default : Twiddle_Real = $signed(16'b0000_0000_0000_0000 ); 
//		endcase
//	end
	 
//	always@(*) begin
//		case(Addr)                             
//			8'd0 : Twiddle_Imag = $signed(16'b0000_0000_0000_0000); 
//			8'd1 : Twiddle_Imag = $signed(16'b1111_1100_1101_1110); 
//			8'd2 : Twiddle_Imag = $signed(16'b1111_1001_1011_1000); 
//			8'd3 : Twiddle_Imag = $signed(16'b1111_0110_1001_0101); 
//			8'd4 : Twiddle_Imag = $signed(16'b1111_0011_0111_0101); 
//			8'd5 : Twiddle_Imag = $signed(16'b1111_0000_0101_0110);
//			8'd6 : Twiddle_Imag = $signed(16'b1110_1101_0011_1001);
//			8'd7 : Twiddle_Imag = $signed(16'b1110_1010_0001_1101);
//			8'd8 : Twiddle_Imag = $signed(16'b1110_0111_0000_0111);
//			8'd9 : Twiddle_Imag = $signed(16'b1110_0011_1111_0101);
//			8'd10 : Twiddle_Imag = $signed(16'b1110_0000_1110_0110); 
//			8'd11 : Twiddle_Imag = $signed(16'b1101_1101_1101_1101); 
//			8'd12 : Twiddle_Imag = $signed(16'b1101_1010_1101_1000);
//			8'd13 : Twiddle_Imag = $signed(16'b1101_0111_1101_1001); 
//			8'd14 : Twiddle_Imag = $signed(16'b1101_0100_1110_0001); 
//			8'd15 : Twiddle_Imag = $signed(16'b1101_0001_1110_1111);
//			8'd16 : Twiddle_Imag = $signed(16'b1100_1111_0000_0100); 
//			8'd17 : Twiddle_Imag = $signed(16'b1100_1100_0010_0011);
//			8'd18 : Twiddle_Imag = $signed(16'b1100_1001_0100_0101); 
//			8'd19 : Twiddle_Imag = $signed(16'b1100_0110_0111_0100);
//			8'd20 : Twiddle_Imag = $signed(16'b1100_0011_1010_1010);
//			8'd21 : Twiddle_Imag = $signed(16'b1100_0000_1110_1001);
//			8'd22 : Twiddle_Imag = $signed(16'b1011_1110_0011_0010);
//			8'd23 : Twiddle_Imag = $signed(16'b1011_1011_1000_0110); 
//			8'd24 : Twiddle_Imag = $signed(16'b1011_1000_1110_0011);
//			8'd25 : Twiddle_Imag = $signed(16'b1011_0110_0100_1101);
//			8'd26 : Twiddle_Imag = $signed(16'b1011_0011_1100_0001);
//			8'd27 : Twiddle_Imag = $signed(16'b1011_0001_0100_0010);
//			8'd28 : Twiddle_Imag = $signed(16'b1010_1110_1100_1100);
//			8'd29 : Twiddle_Imag = $signed(16'b1010_1100_0110_0100);
//			8'd30 : Twiddle_Imag = $signed(16'b1010_1010_0000_1001);
//			8'd31 : Twiddle_Imag = $signed(16'b1010_0111_1011_1111);
//			8'd32 : Twiddle_Imag = $signed(16'b1010_0101_0111_1110);
//			8'd33 : Twiddle_Imag = $signed(16'b1010_0011_0100_1110);
//			8'd34 : Twiddle_Imag = $signed(16'b1010_0001_0010_0111);
//			8'd35 : Twiddle_Imag = $signed(16'b1001_1111_0001_0101);
//			8'd36 : Twiddle_Imag = $signed(16'b1001_1101_0000_1111);
//			8'd37 : Twiddle_Imag = $signed(16'b1001_1011_0001_1001);
//			8'd38 : Twiddle_Imag = $signed(16'b1001_1001_0011_0001);
//			8'd39 : Twiddle_Imag = $signed(16'b1001_0111_0101_1001);
//			8'd40 : Twiddle_Imag = $signed(16'b1001_0101_1001_0010);
//			8'd41 : Twiddle_Imag = $signed(16'b1001_0011_1101_1011);
//			8'd42 : Twiddle_Imag = $signed(16'b1001_0010_0011_0111);
//			8'd43 : Twiddle_Imag = $signed(16'b1001_0000_1010_0001);
//			8'd44 : Twiddle_Imag = $signed(16'b1000_1111_0001_1110);
//			8'd45 : Twiddle_Imag = $signed(16'b1000_1101_1010_1100);
//			8'd46 : Twiddle_Imag = $signed(16'b1000_1100_0100_1010);
//			8'd47 : Twiddle_Imag = $signed(16'b1000_1010_1111_1100);
//			8'd48 : Twiddle_Imag = $signed(16'b1000_1001_1011_1110);
//			8'd49 : Twiddle_Imag = $signed(16'b1000_1000_1001_0100);
//			8'd50 : Twiddle_Imag = $signed(16'b1000_0111_0111_1101);
//			8'd51 : Twiddle_Imag = $signed(16'b1000_0110_0111_0111);
//			8'd52 : Twiddle_Imag = $signed(16'b1000_0101_1000_0101);
//			8'd53 : Twiddle_Imag = $signed(16'b1000_0100_1010_0011); 
//			8'd54 : Twiddle_Imag = $signed(16'b1000_0011_1101_1000);
//			8'd55 : Twiddle_Imag = $signed(16'b1000_0011_0001_1101);
//			8'd56 : Twiddle_Imag = $signed(16'b1000_0010_0111_0110);
//			8'd57 : Twiddle_Imag = $signed(16'b1000_0001_1110_0010);
//			8'd58 : Twiddle_Imag = $signed(16'b1000_0001_0110_0010);
//			8'd59 : Twiddle_Imag = $signed(16'b1000_0000_1111_0110);
//			8'd60 : Twiddle_Imag = $signed(16'b1000_0000_1001_1110);
//			8'd61 : Twiddle_Imag = $signed(16'b1000_0000_0101_1001);
//			8'd62 : Twiddle_Imag = $signed(16'b1000_0000_0010_1000);
//			8'd63 : Twiddle_Imag = $signed(16'b1000_0000_0000_1010);
//			8'd64 : Twiddle_Imag = $signed(16'b1000_0000_0000_0000);
//			8'd65 : Twiddle_Imag = $signed(16'b1000_0000_0000_1010);
//			8'd66 : Twiddle_Imag = $signed(16'b1000_0000_0010_1000);
//			8'd67 : Twiddle_Imag = $signed(16'b1000_0000_0101_1001);
//			8'd68 : Twiddle_Imag = $signed(16'b1000_0000_1001_1110);
//			8'd69 : Twiddle_Imag = $signed(16'b1000_0000_1111_0110); 
//			8'd70 : Twiddle_Imag = $signed(16'b1000_0001_0110_0010);
//			8'd71 : Twiddle_Imag = $signed(16'b1000_0001_1110_0010);
//			8'd72 : Twiddle_Imag = $signed(16'b1000_0010_0111_0110);
//			8'd73 : Twiddle_Imag = $signed(16'b1000_0011_0001_1101);
//			8'd74 : Twiddle_Imag = $signed(16'b1000_0011_1101_1000);
//			8'd75 : Twiddle_Imag = $signed(16'b1000_0100_1010_0011);
//			8'd76 : Twiddle_Imag = $signed(16'b1000_0101_1000_0101);
//			8'd77 : Twiddle_Imag = $signed(16'b1000_0110_0111_0111); 
//			8'd78 : Twiddle_Imag = $signed(16'b1000_0111_0111_1101);
//			8'd79 : Twiddle_Imag = $signed(16'b1000_1000_1001_0100);
//			8'd80 : Twiddle_Imag = $signed(16'b1000_1001_1011_1110);
//			8'd81 : Twiddle_Imag = $signed(16'b1000_1010_1111_1100);
//			8'd82 : Twiddle_Imag = $signed(16'b1000_1100_0100_1010);
//			8'd83 : Twiddle_Imag = $signed(16'b1000_1101_1010_1100);
//			8'd84 : Twiddle_Imag = $signed(16'b1000_1111_0001_1110);
//			8'd85 : Twiddle_Imag = $signed(16'b1001_0000_1010_0001);
//			8'd86 : Twiddle_Imag = $signed(16'b1001_0010_0011_0111);
//			8'd87 : Twiddle_Imag = $signed(16'b1001_0011_1101_1011);
//			8'd88 : Twiddle_Imag = $signed(16'b1001_0101_1001_0010);
//			8'd89 : Twiddle_Imag = $signed(16'b1001_0111_0101_1001);
//			8'd90 : Twiddle_Imag = $signed(16'b1001_1001_0011_0001);
//			8'd91 : Twiddle_Imag = $signed(16'b1001_1011_0001_1001);
//			8'd92 : Twiddle_Imag = $signed(16'b1001_1101_0000_1111);
//			8'd93 : Twiddle_Imag = $signed(16'b1001_1111_0001_0101);
//			8'd94 : Twiddle_Imag = $signed(16'b1010_0001_0010_0111);
//			8'd95 : Twiddle_Imag = $signed(16'b1010_0011_0100_1110);
//			8'd96 : Twiddle_Imag = $signed(16'b1010_0101_0111_1110);
//			8'd97 : Twiddle_Imag = $signed(16'b1010_0111_1011_1111);
//			8'd98 : Twiddle_Imag = $signed(16'b1010_1010_0000_1001);
//			8'd99 : Twiddle_Imag = $signed(16'b1010_1100_0110_0100);
//			8'd100 : Twiddle_Imag = $signed(16'b1010_1110_1100_1100);
//			8'd101 : Twiddle_Imag = $signed(16'b1011_0001_0100_0010);
//			8'd102 : Twiddle_Imag = $signed(16'b1011_0011_1100_0001);
//			8'd103 : Twiddle_Imag = $signed(16'b1011_0110_0100_1101);
//			8'd104 : Twiddle_Imag = $signed(16'b1011_1000_1110_0011);
//			8'd105 : Twiddle_Imag = $signed(16'b1011_1011_1000_0110); 
//			8'd106 : Twiddle_Imag = $signed(16'b1011_1110_0011_0010);
//			8'd107 : Twiddle_Imag = $signed(16'b1100_0000_1110_1001);
//			8'd108 : Twiddle_Imag = $signed(16'b1100_0011_1010_1010);
//			8'd109 : Twiddle_Imag = $signed(16'b1100_0110_0111_0100);
//			8'd110 : Twiddle_Imag = $signed(16'b1100_1001_0100_0101);
//			8'd111 : Twiddle_Imag = $signed(16'b1100_1100_0010_0011);
//			8'd112 : Twiddle_Imag = $signed(16'b1100_1111_0000_0100);
//			8'd113 : Twiddle_Imag = $signed(16'b1101_0001_1110_1111);
//			8'd114 : Twiddle_Imag = $signed(16'b1101_0100_1110_0001);
//			8'd115 : Twiddle_Imag = $signed(16'b1101_0111_1101_1001);
//			8'd116 : Twiddle_Imag = $signed(16'b1101_1010_1101_1000);
//			8'd117 : Twiddle_Imag = $signed(16'b1101_1101_1101_1101);
//			8'd118 : Twiddle_Imag = $signed(16'b1110_0000_1110_0110);
//			8'd119 : Twiddle_Imag = $signed(16'b1110_0011_1111_0101);
//			8'd120 : Twiddle_Imag = $signed(16'b1110_0111_0000_0111);
//			8'd121 : Twiddle_Imag = $signed(16'b1110_1010_0001_1101);
//			8'd122 : Twiddle_Imag = $signed(16'b1110_1101_0011_1001);
//			8'd123 : Twiddle_Imag = $signed(16'b1111_0000_0101_0110);
//			8'd124 : Twiddle_Imag = $signed(16'b1111_0011_0111_0101);
//			8'd125 : Twiddle_Imag = $signed(16'b1111_0110_1001_0101);
//			8'd126 : Twiddle_Imag = $signed(16'b1111_1001_1011_1001);
//			8'd127 : Twiddle_Imag = $signed(16'b1111_1100_1101_1110);
//			default : Twiddle_Imag = $signed(16'b0000_0000_0000_0000);
//			endcase
//        end
//    endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:40:51 05/31/2019 
// Design Name: 
// Module Name:    ROM_Twiddle_Factor 
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
module ROM_Twiddle_Factor(Addr, Twiddle_Real, Twiddle_Imag
    );
   parameter Cnt = 8;
   parameter TF_Width = 16;
   
   input [Cnt-1:0] Addr;
   output reg signed [TF_Width-1:0] Twiddle_Real;
   output reg signed [TF_Width-1:0] Twiddle_Imag;
   
   always@(*) begin
      case(Addr)
         8'd0 : Twiddle_Real = $signed(16'b0111_1111_1111_1111 );
         8'd1 : Twiddle_Real = $signed(16'b0111_1111_1111_0110 );
         8'd2 : Twiddle_Real = $signed(16'b0111_1111_1101_1000 );
         8'd3 : Twiddle_Real = $signed(16'b0111_1111_1010_0111 );
         8'd4 : Twiddle_Real = $signed(16'b0111_1111_0110_0010 );
         8'd5 : Twiddle_Real = $signed(16'b0111_1111_0000_1001 );
         8'd6 : Twiddle_Real = $signed(16'b0111_1110_1001_1101 );
         8'd7 : Twiddle_Real = $signed(16'b0111_1110_0001_1101 );
         8'd8 : Twiddle_Real = $signed(16'b0111_1101_1000_1010 );  
         8'd9 : Twiddle_Real = $signed(16'b0111_1100_1110_0011 );
         8'd10 : Twiddle_Real = $signed(16'b0111_1100_0010_1001 );
         8'd11 : Twiddle_Real = $signed(16'b0111_1011_0101_1101 );
         8'd12 : Twiddle_Real = $signed(16'b0111_1010_0111_1101 );
         8'd13 : Twiddle_Real = $signed(16'b0111_1001_1000_1010 );
         8'd14 : Twiddle_Real = $signed(16'b0111_1000_1000_0100 );
         8'd15 : Twiddle_Real = $signed(16'b0111_0111_0110_1100 );
         8'd16 : Twiddle_Real = $signed(16'b0111_0110_0100_0001 ); 
         8'd17 : Twiddle_Real = $signed(16'b0111_0101_0000_0100 ); 
         8'd18 : Twiddle_Real = $signed(16'b0111_0011_1011_0101 ); 
         8'd19 : Twiddle_Real = $signed(16'b0111_0010_0101_0101 ); 
         8'd20 : Twiddle_Real = $signed(16'b0111_0000_1110_0010 );
         8'd21 : Twiddle_Real = $signed(16'b0110_1111_0101_1111 ); 
         8'd22 : Twiddle_Real = $signed(16'b0110_1101_1100_1010 ); 
         8'd23 : Twiddle_Real = $signed(16'b0110_1100_0010_0100 ); 
         8'd24 : Twiddle_Real = $signed(16'b0110_1010_0110_1101 );
         8'd25 : Twiddle_Real = $signed(16'b0110_1000_1010_0110 ); 
         8'd26 : Twiddle_Real = $signed(16'b0110_0110_1100_1111 ); 
         8'd27 : Twiddle_Real = $signed(16'b0110_0100_1110_1000 ); 
         8'd28 : Twiddle_Real = $signed(16'b0110_0010_1111_0010 );
         8'd29 : Twiddle_Real = $signed(16'b0110_0000_1110_1100 ); 
         8'd30 : Twiddle_Real = $signed(16'b0101_1110_1101_0111 ); 
         8'd31 : Twiddle_Real = $signed(16'b0101_1100_1011_0100 ); 
         8'd32 : Twiddle_Real = $signed(16'b0101_1010_1000_0010 );
         8'd33 : Twiddle_Real = $signed(16'b0101_1000_0100_0010 ); 
         8'd34 : Twiddle_Real = $signed(16'b0101_0101_1111_0101 ); 
         8'd35 : Twiddle_Real = $signed(16'b0101_0011_1001_1011 ); 
         8'd36 : Twiddle_Real = $signed(16'b0101_0001_0011_0011 );
         8'd37 : Twiddle_Real = $signed(16'b0100_1110_1011_1111 ); 
         8'd38 : Twiddle_Real = $signed(16'b0100_1100_0011_1111 ); 
         8'd39 : Twiddle_Real = $signed(16'b0100_1001_1011_0100 ); 
         8'd40 : Twiddle_Real = $signed(16'b0100_0111_0001_1100 );
         8'd41 : Twiddle_Real = $signed(16'b0100_0100_0111_1010 ); 
         8'd42 : Twiddle_Real = $signed(16'b0100_0001_1100_1110 ); 
         8'd43 : Twiddle_Real = $signed(16'b0011_1111_0001_0111 ); 
         8'd44 : Twiddle_Real = $signed(16'b0011_1100_0101_0110 );
         8'd45 : Twiddle_Real = $signed(16'b0011_1001_1000_1100 ); 
         8'd46 : Twiddle_Real = $signed(16'b0011_0110_1011_1010 ); 
         8'd47 : Twiddle_Real = $signed(16'b0011_0011_1101_1110 ); 
         8'd48 : Twiddle_Real = $signed(16'b0011_0000_1111_1011 );
         8'd49 : Twiddle_Real = $signed(16'b0010_1110_0001_0001 ); 
         8'd50 : Twiddle_Real = $signed(16'b0010_1011_0001_1111 ); 
         8'd51 : Twiddle_Real = $signed(16'b0010_1000_0010_0110 ); 
         8'd52 : Twiddle_Real = $signed(16'b0010_0101_0010_1000 );
         8'd53 : Twiddle_Real = $signed(16'b0010_0010_0010_0011 ); 
         8'd54 : Twiddle_Real = $signed(16'b0001_1111_0001_1001 ); 
         8'd55 : Twiddle_Real = $signed(16'b0001_1100_0000_1011 ); 
         8'd56 : Twiddle_Real = $signed(16'b0001_1000_1111_1000 );
         8'd57 : Twiddle_Real = $signed(16'b0001_0101_1110_0010 ); 
         8'd58 : Twiddle_Real = $signed(16'b0001_0010_1100_1000 ); 
         8'd59 : Twiddle_Real = $signed(16'b0000_1111_1010_1011 ); 
         8'd60 : Twiddle_Real = $signed(16'b0000_1100_1000_1011 );   
         8'd61 : Twiddle_Real = $signed(16'b0000_1001_0110_1010 ); 
         8'd62 : Twiddle_Real = $signed(16'b0000_0110_0100_0111 ); 
         8'd63 : Twiddle_Real = $signed(16'b0000_0011_0010_0100 ); 
         8'd64 : Twiddle_Real = $signed(16'b0000_0000_0000_0000 );
         8'd65 : Twiddle_Real = $signed(16'b1111_1100_1101_1100 );
         8'd66 : Twiddle_Real = $signed(16'b1111_1001_1011_1001 );
         8'd67 : Twiddle_Real = $signed(16'b1111_0110_1001_0110 );
         8'd68 : Twiddle_Real = $signed(16'b1111_0011_0111_0101 );
         8'd69 : Twiddle_Real = $signed(16'b1111_0000_0101_0101 );
         8'd70 : Twiddle_Real = $signed(16'b1110_1101_0011_1000 );
         8'd71 : Twiddle_Real = $signed(16'b1110_1010_0001_1110 );
         8'd72 : Twiddle_Real = $signed(16'b1110_0111_0000_1000 );
         8'd73 : Twiddle_Real = $signed(16'b1110_0011_1111_0101 );
         8'd74 : Twiddle_Real = $signed(16'b1110_0000_1110_0111 );
         8'd75 : Twiddle_Real = $signed(16'b1101_1101_1101_1101 );
         8'd76 : Twiddle_Real = $signed(16'b1101_1010_1101_1000 );
         8'd77 : Twiddle_Real = $signed(16'b1101_0111_1101_1010 );
         8'd78 : Twiddle_Real = $signed(16'b1101_0100_1110_0001 );
         8'd79 : Twiddle_Real = $signed(16'b1101_0001_1110_1111 );
         8'd80 : Twiddle_Real = $signed(16'b1100_1111_0000_0101 );
         8'd81 : Twiddle_Real = $signed(16'b1100_1100_0010_0010 );
         8'd82 : Twiddle_Real = $signed(16'b1100_1001_0100_0110 );
         8'd83 : Twiddle_Real = $signed(16'b1100_0110_0111_0100 );
         8'd84 : Twiddle_Real = $signed(16'b1100_0011_1010_1010 );
         8'd85 : Twiddle_Real = $signed(16'b1100_0000_1110_1001 );
         8'd86 : Twiddle_Real = $signed(16'b1011_1110_0011_0010 );
         8'd87 : Twiddle_Real = $signed(16'b1011_1011_1000_0110 );
         8'd88 : Twiddle_Real = $signed(16'b1011_1000_1110_0100 );
         8'd89 : Twiddle_Real = $signed(16'b1011_0110_0100_1100 );
         8'd90 : Twiddle_Real = $signed(16'b1011_0011_1100_0001 );
         8'd91 : Twiddle_Real = $signed(16'b1011_0001_0100_0001 );
         8'd92 : Twiddle_Real = $signed(16'b1010_1110_1100_1101 );
         8'd93 : Twiddle_Real = $signed(16'b1010_1100_0110_0101 );
         8'd94 : Twiddle_Real = $signed(16'b1010_1010_0000_1011 );
         8'd95 : Twiddle_Real = $signed(16'b1010_0111_1011_1110 );
         8'd96 : Twiddle_Real = $signed(16'b1010_0101_0111_1110 );
         8'd97 : Twiddle_Real = $signed(16'b1010_0011_0100_1100 );
         8'd98 : Twiddle_Real = $signed(16'b1010_0001_0010_1001 );
         8'd99 : Twiddle_Real = $signed(16'b1001_1111_0001_0100 );
         8'd100 : Twiddle_Real = $signed(16'b1001_1101_0000_1111 );
         8'd101 : Twiddle_Real = $signed(16'b1001_1011_0001_1000 );
         8'd102 : Twiddle_Real = $signed(16'b1001_1001_0011_0001 );
         8'd103 : Twiddle_Real = $signed(16'b1001_0111_0101_1010 );
         8'd104 : Twiddle_Real = $signed(16'b1001_0101_1001_0011 );
         8'd105 : Twiddle_Real = $signed(16'b1001_0011_1101_1100 );
         8'd106 : Twiddle_Real = $signed(16'b1001_0010_0011_0110 );
         8'd107 : Twiddle_Real = $signed(16'b1001_0000_1010_0001 );
         8'd108 : Twiddle_Real = $signed(16'b1000_1111_0001_1110 );
         8'd109 : Twiddle_Real = $signed(16'b1000_1101_1010_1011 );
         8'd110 : Twiddle_Real = $signed(16'b1000_1100_0100_1011 );
         8'd111 : Twiddle_Real = $signed(16'b1000_1010_1111_1100 );
         8'd112 : Twiddle_Real = $signed(16'b1000_1001_1011_1111 );
         8'd113 : Twiddle_Real = $signed(16'b1000_1000_1001_0100 );
         8'd114 : Twiddle_Real = $signed(16'b1000_0111_0111_1100 );
         8'd115 : Twiddle_Real = $signed(16'b1000_0110_0111_0110 );
         8'd116 : Twiddle_Real = $signed(16'b1000_0101_1000_0011 );
         8'd117 : Twiddle_Real = $signed(16'b1000_0100_1010_0011 );
         8'd118 : Twiddle_Real = $signed(16'b1000_0011_1101_0111 );
         8'd119 : Twiddle_Real = $signed(16'b1000_0011_0001_1101 );
         8'd120 : Twiddle_Real = $signed(16'b1000_0010_0111_0110 );
         8'd121 : Twiddle_Real = $signed(16'b1000_0001_1110_0011 );
         8'd122 : Twiddle_Real = $signed(16'b1000_0001_0110_0011 );
         8'd123 : Twiddle_Real = $signed(16'b1000_0000_1111_0111 );
         8'd124 : Twiddle_Real = $signed(16'b1000_0000_1001_1110 );
         8'd125 : Twiddle_Real = $signed(16'b1000_0000_0101_1001 );
         8'd126 : Twiddle_Real = $signed(16'b1000_0000_0010_1000 );
         8'd127 : Twiddle_Real = $signed(16'b1000_0000_0000_1010 );
         default : Twiddle_Real = $signed(16'b0000_0000_0000_0000 ); 
      endcase
   end
    
   always@(*) begin
      case(Addr)                             
         8'd0 : Twiddle_Imag = $signed(16'b0000_0000_0000_0000);
         8'd1 : Twiddle_Imag = $signed(16'b1111_1100_1101_1100);
         8'd2 : Twiddle_Imag = $signed(16'b1111_1001_1011_1001);
         8'd3 : Twiddle_Imag = $signed(16'b1111_0110_1001_0110);
         8'd4 : Twiddle_Imag = $signed(16'b1111_0011_0111_0101); 
         8'd5 : Twiddle_Imag = $signed(16'b1111_0000_0101_0101);
         8'd6 : Twiddle_Imag = $signed(16'b1110_1101_0011_1000);
         8'd7 : Twiddle_Imag = $signed(16'b1110_1010_0001_1110);
         8'd8 : Twiddle_Imag = $signed(16'b1110_0111_0000_1000); 
         8'd9 : Twiddle_Imag = $signed(16'b1110_0011_1111_0101);
         8'd10 : Twiddle_Imag = $signed(16'b1110_0000_1110_0111);
         8'd11 : Twiddle_Imag = $signed(16'b1101_1101_1101_1101);
         8'd12 : Twiddle_Imag = $signed(16'b1101_1010_1101_1000); 
         8'd13 : Twiddle_Imag = $signed(16'b1101_0111_1101_1010);
         8'd14 : Twiddle_Imag = $signed(16'b1101_0100_1110_0001);
         8'd15 : Twiddle_Imag = $signed(16'b1101_0001_1110_1111);
         8'd16 : Twiddle_Imag = $signed(16'b1100_1111_0000_0101);
         8'd17 : Twiddle_Imag = $signed(16'b1100_1100_0010_0010);
         8'd18 : Twiddle_Imag = $signed(16'b1100_1001_0100_0110);
         8'd19 : Twiddle_Imag = $signed(16'b1100_0110_0111_0100);
         8'd20 : Twiddle_Imag = $signed(16'b1100_0011_1010_1010);
         8'd21 : Twiddle_Imag = $signed(16'b1100_0000_1110_1001);
         8'd22 : Twiddle_Imag = $signed(16'b1011_1110_0011_0010);
         8'd23 : Twiddle_Imag = $signed(16'b1011_1011_1000_0110);
         8'd24 : Twiddle_Imag = $signed(16'b1011_1000_1110_0100);
         8'd25 : Twiddle_Imag = $signed(16'b1011_0110_0100_1100);
         8'd26 : Twiddle_Imag = $signed(16'b1011_0011_1100_0001);
         8'd27 : Twiddle_Imag = $signed(16'b1011_0001_0100_0001);
         8'd28 : Twiddle_Imag = $signed(16'b1010_1110_1100_1101);
         8'd29 : Twiddle_Imag = $signed(16'b1010_1100_0110_0101);
         8'd30 : Twiddle_Imag = $signed(16'b1010_1010_0000_1011);
         8'd31 : Twiddle_Imag = $signed(16'b1010_0111_1011_1110);
         8'd32 : Twiddle_Imag = $signed(16'b1010_0101_0111_1110);
         8'd33 : Twiddle_Imag = $signed(16'b1010_0011_0100_1100);
         8'd34 : Twiddle_Imag = $signed(16'b1010_0001_0010_1001);
         8'd35 : Twiddle_Imag = $signed(16'b1001_1111_0001_0100);
         8'd36 : Twiddle_Imag = $signed(16'b1001_1101_0000_1110);
         8'd37 : Twiddle_Imag = $signed(16'b1001_1011_0001_1000);
         8'd38 : Twiddle_Imag = $signed(16'b1001_1001_0011_0001);
         8'd39 : Twiddle_Imag = $signed(16'b1001_0111_0101_1010);
         8'd40 : Twiddle_Imag = $signed(16'b1001_0101_1001_0011);
         8'd41 : Twiddle_Imag = $signed(16'b1001_0011_1101_1100);
         8'd42 : Twiddle_Imag = $signed(16'b1001_0010_0011_0110);
         8'd43 : Twiddle_Imag = $signed(16'b1001_0000_1010_0001);
         8'd44 : Twiddle_Imag = $signed(16'b1000_1111_0001_1110);
         8'd45 : Twiddle_Imag = $signed(16'b1000_1101_1010_1011);
         8'd46 : Twiddle_Imag = $signed(16'b1000_1100_0100_1011);
         8'd47 : Twiddle_Imag = $signed(16'b1000_1010_1111_1100);
         8'd48 : Twiddle_Imag = $signed(16'b1000_1001_1011_1111);
         8'd49 : Twiddle_Imag = $signed(16'b1000_1000_1001_0100);
         8'd50 : Twiddle_Imag = $signed(16'b1000_0111_0111_1100);
         8'd51 : Twiddle_Imag = $signed(16'b1000_0110_0111_0110);
         8'd52 : Twiddle_Imag = $signed(16'b1000_0101_1000_0011);
         8'd53 : Twiddle_Imag = $signed(16'b1000_0100_1010_0011); 
         8'd54 : Twiddle_Imag = $signed(16'b1000_0011_1101_0111);
         8'd55 : Twiddle_Imag = $signed(16'b1000_0011_0001_1101);
         8'd56 : Twiddle_Imag = $signed(16'b1000_0010_0111_0110);
         8'd57 : Twiddle_Imag = $signed(16'b1000_0001_1110_0011);
         8'd58 : Twiddle_Imag = $signed(16'b1000_0001_0110_0011);
         8'd59 : Twiddle_Imag = $signed(16'b1000_0000_1111_0111);
         8'd60 : Twiddle_Imag = $signed(16'b1000_0000_1001_1110);
         8'd61 : Twiddle_Imag = $signed(16'b1000_0000_0101_1001);
         8'd62 : Twiddle_Imag = $signed(16'b1000_0000_0010_1000);
         8'd63 : Twiddle_Imag = $signed(16'b1000_0000_0000_1010);
         8'd64 : Twiddle_Imag = $signed(16'b1000_0000_0000_0000);
         8'd65 : Twiddle_Imag = $signed(16'b1000_0000_0000_1010);
         8'd66 : Twiddle_Imag = $signed(16'b1000_0000_0010_1000);
         8'd67 : Twiddle_Imag = $signed(16'b1000_0000_0101_1001);
         8'd68 : Twiddle_Imag = $signed(16'b1000_0000_1001_1110);
         8'd69 : Twiddle_Imag = $signed(16'b1000_0000_1111_0111);
         8'd70 : Twiddle_Imag = $signed(16'b1000_0001_0110_0011);
         8'd71 : Twiddle_Imag = $signed(16'b1000_0001_1110_0011);
         8'd72 : Twiddle_Imag = $signed(16'b1000_0010_0111_0110);
         8'd73 : Twiddle_Imag = $signed(16'b1000_0011_0001_1101);
         8'd74 : Twiddle_Imag = $signed(16'b1000_0011_1101_0111);
         8'd75 : Twiddle_Imag = $signed(16'b1000_0100_1010_0011);
         8'd76 : Twiddle_Imag = $signed(16'b1000_0101_1000_0101);
         8'd77 : Twiddle_Imag = $signed(16'b1000_0110_0111_0110);
         8'd78 : Twiddle_Imag = $signed(16'b1000_0111_0111_1100);
         8'd79 : Twiddle_Imag = $signed(16'b1000_1000_1001_0100);
         8'd80 : Twiddle_Imag = $signed(16'b1000_1001_1011_1111);
         8'd81 : Twiddle_Imag = $signed(16'b1000_1010_1111_1100);
         8'd82 : Twiddle_Imag = $signed(16'b1000_1100_0100_1011);
         8'd83 : Twiddle_Imag = $signed(16'b1000_1101_1010_1011);
         8'd84 : Twiddle_Imag = $signed(16'b1000_1111_0001_1110);
         8'd85 : Twiddle_Imag = $signed(16'b1001_0000_1010_0001);
         8'd86 : Twiddle_Imag = $signed(16'b1001_0010_0011_0110);
         8'd87 : Twiddle_Imag = $signed(16'b1001_0011_1101_1100);
         8'd88 : Twiddle_Imag = $signed(16'b1001_0101_1001_0011);
         8'd89 : Twiddle_Imag = $signed(16'b1001_0111_0101_1010);
         8'd90 : Twiddle_Imag = $signed(16'b1001_1001_0011_0001);
         8'd91 : Twiddle_Imag = $signed(16'b1001_1011_0001_1000);
         8'd92 : Twiddle_Imag = $signed(16'b1001_1101_0000_1111);
         8'd93 : Twiddle_Imag = $signed(16'b1001_1111_0001_0100);
         8'd94 : Twiddle_Imag = $signed(16'b1010_0001_0010_1001);
         8'd95 : Twiddle_Imag = $signed(16'b1010_0011_0100_1100);
         8'd96 : Twiddle_Imag = $signed(16'b1010_0101_0111_1110);
         8'd97 : Twiddle_Imag = $signed(16'b1010_0111_1011_1110);
         8'd98 : Twiddle_Imag = $signed(16'b1010_1010_0000_1011);
         8'd99 : Twiddle_Imag = $signed(16'b1010_1100_0110_0101);
         8'd100 : Twiddle_Imag = $signed(16'b1010_1110_1100_1101);
         8'd101 : Twiddle_Imag = $signed(16'b1011_0001_0100_0001);
         8'd102 : Twiddle_Imag = $signed(16'b1011_0011_1100_0001);
         8'd103 : Twiddle_Imag = $signed(16'b1011_0110_0100_1100);
         8'd104 : Twiddle_Imag = $signed(16'b1011_1000_1110_0100);
         8'd105 : Twiddle_Imag = $signed(16'b1011_1011_1000_0110);
         8'd106 : Twiddle_Imag = $signed(16'b1011_1110_0011_0010);
         8'd107 : Twiddle_Imag = $signed(16'b1100_0000_1110_1001);
         8'd108 : Twiddle_Imag = $signed(16'b1100_0011_1010_1010);
         8'd109 : Twiddle_Imag = $signed(16'b1100_0110_0111_0100);
         8'd110 : Twiddle_Imag = $signed(16'b1100_1001_0100_0110);
         8'd111 : Twiddle_Imag = $signed(16'b1100_1100_0010_0010);
         8'd112 : Twiddle_Imag = $signed(16'b1100_1111_0000_0101);
         8'd113 : Twiddle_Imag = $signed(16'b1101_0001_1110_1111);
         8'd114 : Twiddle_Imag = $signed(16'b1101_0100_1110_0001);
         8'd115 : Twiddle_Imag = $signed(16'b1101_0111_1101_1010);
         8'd116 : Twiddle_Imag = $signed(16'b1101_1010_1101_1000);
         8'd117 : Twiddle_Imag = $signed(16'b1101_1101_1101_1101);
         8'd118 : Twiddle_Imag = $signed(16'b1110_0000_1110_0111);
         8'd119 : Twiddle_Imag = $signed(16'b1110_0011_1111_0101);
         8'd120 : Twiddle_Imag = $signed(16'b1110_0111_0000_1000);
         8'd121 : Twiddle_Imag = $signed(16'b1110_1010_0001_1110);
         8'd122 : Twiddle_Imag = $signed(16'b1110_1101_0011_1000);
         8'd123 : Twiddle_Imag = $signed(16'b1111_0000_0101_0101);
         8'd124 : Twiddle_Imag = $signed(16'b1111_0011_0111_0101);
         8'd125 : Twiddle_Imag = $signed(16'b1111_0110_1001_0110);
         8'd126 : Twiddle_Imag = $signed(16'b1111_1001_1011_1001);
         8'd127 : Twiddle_Imag = $signed(16'b1111_1100_1101_1100);
         default : Twiddle_Imag = $signed(16'b0000_0000_0000_0000);
         endcase
        end
    endmodule