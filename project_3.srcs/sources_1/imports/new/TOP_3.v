`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/03 19:21:06
// Design Name: 
// Module Name: TOP_3
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


module TOP_3#(parameter In_BW =12,
              parameter BW =16,
              parameter DW =32,
              parameter Cnt = 8
            
            )(
            input clk,
            input rst_n,
            input valid_in,
            input start,
            input MOSI,
            input SCK,
            input nSS,
            output MISO,
            output Done_FFT

           );
          wire [31:0] fft_out_mem_wr_data;
          
          wire signed[DW-1:0]fft_in_mem_rd_data;
          
          
          wire signed[BW-1:0] Real_Data_out,Imag_Data_out;
          reg signed [BW-1:0] Real_Data_out_1,Imag_Data_out_1;
          reg signed [BW-1:0] Real_Data_out_2,Imag_Data_out_2;
          wire [DW-1:0]Flow_cnt_1;
          wire [DW-1:0]Flow_cnt_2;
          wire [DW-1:0]Flow_cnt_3;
          wire [DW-1:0]Flow_cnt_4;
          wire [DW-1:0]Flow_cnt_5;
          wire [DW-1:0]Flow_cnt_6;
          wire [DW-1:0]Flow_cnt_7;
          wire [DW-1:0]Flow_cnt_8;
          wire valid_in_Buff;
          wire valid_out_Buff;
          wire [Cnt-1:0] In_Buff_Addr;  
          wire [Cnt:0]   Out_Buff_Addr;  
          wire [DW-1:0] FFT_out;
          
          
   always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            Real_Data_out_1 <= 0;
            Imag_Data_out_1 <= 0;
        end
        else begin
            Real_Data_out_1 <= Real_Data_out;
            Imag_Data_out_1 <= Imag_Data_out;
        end
   end
      always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            Real_Data_out_2 <= 0;
            Imag_Data_out_2 <= 0;
        end
        else begin
            Real_Data_out_2 <= Real_Data_out_1;
            Imag_Data_out_2 <= Imag_Data_out_1;
        end
   end
   
          
            
//    always @(posedge clk or negedge rst_n) begin
//             if(!rst_n) begin
//                 FFT_Out_Reg <= 0;
//             end
//             else begin
//                 if(valid_out_Buff)
//                     FFT_Out_Reg <= {Real_Data_out_2,Imag_Data_out_2};
//                 else
//                     FFT_Out_Reg <= 0;
//                end
//            end
            
   assign FFT_out = {Real_Data_out_2,Imag_Data_out_2};
    
     //muxCnt를 어떤식으로 기입하지?
    assign fft_out_mem_wr_data= (Out_Buff_Addr[Cnt] == 1'b0)? FFT_out: (Out_Buff_Addr[2:0]==3'b000)? Flow_cnt_1:(Out_Buff_Addr[2:0]==3'b001)?
           Flow_cnt_2 :(Out_Buff_Addr[2:0]==3'b010)? Flow_cnt_3 :(Out_Buff_Addr[2:0]==3'b011)? Flow_cnt_4 :(Out_Buff_Addr[2:0]==3'b100)?
           Flow_cnt_5 :(Out_Buff_Addr[2:0]==3'b101)? Flow_cnt_6 :(Out_Buff_Addr[2:0]==3'b110)? Flow_cnt_7: Flow_cnt_8 ;

    reg SCK_reg; 
    reg nSS_reg;
    reg start_Reg;
    reg valid_in_Reg;
    always@(posedge clk or negedge rst_n) begin
                if(~rst_n) begin        //똑같이 나올 수 있음.
                    SCK_reg <= 1'b0;
                    nSS_reg <= 1'b1;    //Active low, default value is 1 
                    start_Reg <= 1'b0;
                    valid_in_Reg <= 1'b0;
                end else begin
                    SCK_reg <= SCK;
                    nSS_reg  <= nSS;     
                    start_Reg <= start;
                    valid_in_Reg <= valid_in;    
                end  
     end
          
          
    TOP TOP( //FFT, Controller
                .clk(clk), 
                .rst_n(rst_n),
                .start(start_Reg),
                .Done(Done_FFT),
                .valid_in(valid_in_Reg),
                .valid_in_Buff(valid_in_Buff),
                .valid_out_Buff(valid_out_Buff),
                .fft_in_mem_rd_data(fft_in_mem_rd_data [In_BW-1:0]),
                .Real_Data_out(Real_Data_out),
                .Imag_Data_out(Imag_Data_out), //output buffer을 통과한 데이터
                .Flow_cnt_1(Flow_cnt_1),
                .Flow_cnt_2(Flow_cnt_2),
                .Flow_cnt_3(Flow_cnt_3),
                .Flow_cnt_4(Flow_cnt_4),
                .Flow_cnt_5(Flow_cnt_5),
                .Flow_cnt_6(Flow_cnt_6),
                .Flow_cnt_7(Flow_cnt_7),
                .Flow_cnt_8(Flow_cnt_8),
                .In_Buff_Addr(In_Buff_Addr), 
                .Out_Buff_Addr(Out_Buff_Addr)
                );
    
    
    TOP_2 TOP_2( //Slave, Input_BF, Output_BF
               .MOSI(MOSI),
               .SCK(SCK_reg),
               .nSS(nSS_reg),
               .clk(clk),
               .rst_n(rst_n),
//               .valid_in(valid_in),
               .fft_rd(valid_in_Buff),
               .fft_wr(valid_out_Buff),                       // FFT read and Write enable signals (Active HIGH)
               .MISO(MISO),
               .fft_out_mem_wr_data(fft_out_mem_wr_data),
               .in_mem_address(In_Buff_Addr),
               .out_mem_address(Out_Buff_Addr),
               .fft_in_mem_rd_data(fft_in_mem_rd_data)
               );
endmodule
