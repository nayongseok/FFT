`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 13:42:03
// Design Name: 
// Module Name: TOP
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

module TOP #(
       parameter In_BW = 12,
       parameter BW = 12,
       parameter Out_BW = 19,
       parameter Cut_BW = 4,
       parameter Cnt = 8,
       parameter Addr_Cnt = 8,
       parameter DWIDTH = 32
       )(
        input clk, 
        input rst_n,
        input valid_in,
		input start,
	  //input buffer	
	    input wire signed[In_BW-1:0]fft_in_mem_rd_data,//real
	    
	    //output
	    output wire Done, //C->F	
        output wire signed[15:0] Real_Data_out,Imag_Data_out, //output buffer을 통과한 데이터
        output wire [31:0]Flow_cnt_1,
        output wire [31:0]Flow_cnt_2,
        output wire [31:0]Flow_cnt_3,
        output wire [31:0]Flow_cnt_4,
        output wire [31:0]Flow_cnt_5,
        output wire [31:0]Flow_cnt_6,
        output wire [31:0]Flow_cnt_7,
        output wire [31:0]Flow_cnt_8,
        output wire valid_in_Buff,
        output wire valid_out_Buff,
        output [Cnt-1:0] In_Buff_Addr, //In_Buff_Addr,
        output [Cnt:0]   Out_Buff_Addr //Out_Buff_Addr         
    );
        wire valid_out; //F->C
        wire Start_FFT;
        wire valid_in_FFT;

    //////////////////////////////////////////////////////////////////////FFT/////////////////////////////////////////////////////////////////////////
    Top_FFT_256pt #( .In_BW(In_BW) 
//                     .Cnt(Cnt)
                   ) 
             Top_FFT_256pt( 
             .clk(clk),                                //
             .rst_n(rst_n),                            //
             .start(Start_FFT),                        //
             .valid(valid_in_FFT),                         //
             .sample_re_data(fft_in_mem_rd_data),                 //
             .sample_im_data({(In_BW){1'b0}}),         //
             .re_data(Real_Data_out),                  //
             .im_data(Imag_Data_out),                  //
             .valid_out(valid_out),                    //
             .Done(Done),                              //
             .Flow_cnt_1(Flow_cnt_1),                  // 
             .Flow_cnt_2(Flow_cnt_2),
             .Flow_cnt_3(Flow_cnt_3),
             .Flow_cnt_4(Flow_cnt_4),
             .Flow_cnt_5(Flow_cnt_5),
             .Flow_cnt_6(Flow_cnt_6),
             .Flow_cnt_7(Flow_cnt_7),
             .Flow_cnt_8(Flow_cnt_8)
              );

     /////////////////////////////////////////////////////////////////Controller//////////////////////////////////////////////////////////////////////////
     Top_Controller Top_Controller
         (
         .clk(clk),                           //
         .rst_n(rst_n),                       //
         .Start(start),                       //
         .Start_FFT(Start_FFT),               //
         .valid_out(valid_out),               //
         .valid_in(valid_in),   
         .valid_in_Buff(valid_in_Buff),       //
         .valid_in_FFT(valid_in_FFT),
         .valid_out_Buff(valid_out_Buff),     //
         .Done(Done),                         //
         .In_Buff_Addr(In_Buff_Addr),         //
         .Out_Buff_Addr(Out_Buff_Addr)        //
         );

       
endmodule