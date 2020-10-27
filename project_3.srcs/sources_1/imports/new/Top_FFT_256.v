`timescale 1ns / 1ps
`define p 2
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:19 05/27/2019 
// Design Name: 
// Module Name:    Top_FFT_8pt 
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

module Top_FFT_256pt #(
      parameter In_BW = 12,
      parameter Out_BW = 19,
      parameter Cut_BW = 4,
      parameter Cnt = 10,
      parameter BW = 12
      )
   
   (
      input clk, 
      input rst_n,
      input start,
      input valid,
      
      input signed[In_BW-1:0] sample_re_data,
      input signed[In_BW-1:0] sample_im_data,
      
      input wire Done,

      output wire valid_out,
      
      output wire [31:0]Flow_cnt_1,
      output wire [31:0]Flow_cnt_2,
      output wire [31:0]Flow_cnt_3,
      output wire [31:0]Flow_cnt_4,
      output wire [31:0]Flow_cnt_5,
      output wire [31:0]Flow_cnt_6,
      output wire [31:0]Flow_cnt_7,
      output wire [31:0]Flow_cnt_8,
    
      output wire signed[Out_BW-Cut_BW:0] re_data,
      output wire signed[Out_BW-Cut_BW:0] im_data
    );
    

wire [Cnt-1:0] cnt; 

wire signed [In_BW:0]sample_re_data_128;
wire signed [In_BW:0]sample_im_data_128;
wire signed [In_BW+1:0]sample_re_data_64;
wire signed [In_BW+1:0]sample_im_data_64;
wire signed [In_BW+2:0]sample_re_data_32;
wire signed [In_BW+2:0]sample_im_data_32;
wire signed [In_BW+3:0]sample_re_data_16;
wire signed [In_BW+3:0]sample_im_data_16;
wire signed [In_BW+4:0]sample_re_data_8;
wire signed [In_BW+4:0]sample_im_data_8;
wire signed [In_BW+5:0]sample_re_data_4;
wire signed [In_BW+5:0]sample_im_data_4;
wire signed [In_BW+6:0]sample_re_data_2;
wire signed [In_BW+6:0]sample_im_data_2;
wire signed [In_BW+7:0]sample_re_data_out;
wire signed [In_BW+7:0]sample_im_data_out;


reg BF_en_01;
reg BF_en_02;   //1clk delay
reg [1:0] BF_en_03;  //2
reg [2:0] BF_en_04;  //3
reg [3:0] BF_en_05;  //4
reg [4:0] BF_en_06;  //5
reg [5:0] BF_en_07;  //6
reg BF_en_08;       //7


wire BF_en_1;
reg BF_en_2;   //1clk delay
reg [1:0] BF_en_3;  //2
reg [2:0] BF_en_4;  //3
reg [3:0] BF_en_5;  //4
reg [4:0] BF_en_6;  //5
reg [5:0] BF_en_7;  //6
wire BF_en_8;       //7

always@(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
      BF_en_01 <= 0;
      BF_en_02 <= 0;
      BF_en_03 <= 0;
      BF_en_04 <= 0;
      BF_en_05 <= 0;
      BF_en_06 <= 0;
      BF_en_07 <= 0;
      BF_en_08 <= 0;
      end
   else begin
      if(valid) begin
            BF_en_01 <= BF_en_1;
            BF_en_02 <= BF_en_2;
            BF_en_03[1:0] <= BF_en_3[1:0];
            BF_en_04[2:0] <= BF_en_4[2:0];
            BF_en_05[3:0] <= BF_en_5[3:0];
            BF_en_06[4:0] <= BF_en_6[4:0];
            BF_en_07[5:0] <= BF_en_7[5:0];
            BF_en_08 <= BF_en_8;
            end
   end
end


Counter  Counter(.clk(clk), .rst_n(rst_n), .start(start), .valid(valid), .cnt(cnt), .valid_out(valid_out), .Done(Done) /*, .init(init)*/ );

Stage #(In_BW, 128, Cnt-2'd2) Ubu_shift_256_sdf(  //stage 1
                                    .clk(clk) ,
                                    .start(start), 
                                    .rst_n(rst_n),
                                    .bf_en(BF_en_01),
                                    .cnt(cnt[7:0]),
                                    .valid(valid),
                                    .sample_re_data(sample_re_data/*sample_re_data_64*/), 
                                    .sample_im_data(sample_im_data/*sample_im_data_64*/),
                                    .re_data(sample_re_data_128),
                                    .im_data(sample_im_data_128),
                                    .Done(Done),
                                    .Flow_cnt(Flow_cnt_1)
                                  );   
                                 
Stage #(In_BW+1, 64, Cnt-2'd2) Ubu_shift_128_sdf( //stage 2
                                    .clk(clk) , 
                                    .start(start), 
                                    .rst_n(rst_n),
                                    .bf_en(BF_en_02),
                                    .cnt({1'b0,cnt[6:0]}),
                                    .valid(valid),
                                    .sample_re_data(sample_re_data_128/*sample_re_data_64*/), 
                                    .sample_im_data(sample_im_data_128/*sample_im_data_64*/),
                                    .re_data(sample_re_data_64),
                                    .im_data(sample_im_data_64),        
                                    .Done(Done),
                                    .Flow_cnt(Flow_cnt_2)
                                   );

Stage #(In_BW+2, 32, Cnt-2'd2) Ubu_shift_64_sdf( //stage 3
                                    .clk(clk) , 
                                    .start(start), 
                                    .rst_n(rst_n),
                                    .bf_en(BF_en_03[1]),
                                    .cnt({2'b00,cnt[5:0]}),
                                    .valid(valid),
                                    .sample_re_data(sample_re_data_64/*sample_re_data_64*/), 
                                    .sample_im_data(sample_im_data_64/*sample_im_data_64*/),
                                    .re_data(sample_re_data_32),
                                    .im_data(sample_im_data_32),
                                    .Done(Done),
                                    .Flow_cnt(Flow_cnt_3)
                                  );   
Stage #(In_BW+3, 16, Cnt-2'd2) Ubu_shift_32_sdf( //stage 4
                                    .clk(clk) , 
                                    .start(start), 
                                    .rst_n(rst_n),
                                    .bf_en(BF_en_04[2]),
                                    .cnt({3'b000,cnt[4:0]}),
                                    .valid(valid),
                                    .sample_re_data(sample_re_data_32), 
                                    .sample_im_data(sample_im_data_32),
                                    .re_data(sample_re_data_16),
                                    .im_data(sample_im_data_16),
                                    .Done(Done),
                                    .Flow_cnt(Flow_cnt_4)
                                  );   
Stage #(In_BW+4, 8, Cnt-2'd2) Ubu_shift_16_sdf( //stage 5
                                    .clk(clk) , 
                                    .start(start), 
                                    .rst_n(rst_n),
                                    .bf_en(BF_en_05[3]),
                                    .cnt({4'b0000,cnt[3:0]}),
                                    .valid(valid),
                                    .sample_re_data(sample_re_data_16), 
                                    .sample_im_data(sample_im_data_16),
                                    .re_data(sample_re_data_8),
                                    .im_data(sample_im_data_8),
                                    .Done(Done),
                                    .Flow_cnt(Flow_cnt_5)
                                  );   
Stage #(In_BW+5, 4, Cnt-2'd2) Ubu_shift_8_sdf( //stage 6
                                    .clk(clk) , 
                                    .start(start), 
                                    .rst_n(rst_n),
                                    .bf_en(BF_en_06[4]),
                                    .cnt({5'b00000,cnt[2:0]}),
                                    .valid(valid),
                                    .sample_re_data(sample_re_data_8), 
                                    .sample_im_data(sample_im_data_8),
                                    .re_data(sample_re_data_4),
                                    .im_data(sample_im_data_4),
                                    .Done(Done),
                                    .Flow_cnt(Flow_cnt_6)
                                  );   
    
    
    
Stage #(In_BW+6, 2, Cnt-2'd2) Ubu_shift_4_sdf( //stage 7
                                    .clk(clk) , 
                                    .start(start), 
                                    .rst_n(rst_n),
                                    .bf_en(BF_en_07[5]),
                                    .cnt({6'b000000,cnt[1:0]}),
                                    .valid(valid),
                                    .sample_re_data(sample_re_data_4),
                                    .sample_im_data(sample_im_data_4),
                                    .re_data(sample_re_data_2),
                                    .im_data(sample_im_data_2),
                                    .Done(Done),
                                    .Flow_cnt(Flow_cnt_7)
                                  );
   
Stage_Fin #(In_BW+7, 1, Cnt-2'd2) Ubu_shift_2_sdf( //stage 8
                                    .clk(clk),
                                    .start(start), 
                                    .rst_n(rst_n),
                                    .bf_en(BF_en_08),
                                    //.cnt(cnt),
                                    .valid(valid),
                                    .sample_re_data(sample_re_data_2),
                                    .sample_im_data(sample_im_data_2),
                                    .re_data(sample_re_data_out),
                                    .im_data(sample_im_data_out),
                                    .Done(Done),
                                    .Flow_cnt(Flow_cnt_8)
                                  );   

assign BF_en_1 = cnt[7];
//always@(posedge clk or negedge rst_n) begin
//   if(!rst_n)
//      BF_en_1 <= 0;
//   else begin
//      if(valid)
//         BF_en_1<=cnt[7];
//   end
//end
always@(posedge clk or negedge rst_n) begin
   if(!rst_n)
      BF_en_2 <= 0;
   else begin
      if(valid)
         BF_en_2<=cnt[6];
//         BF_en_2[1]<=BF_en_2[0];
   end
end

always@(posedge clk or negedge rst_n) begin
   if(!rst_n)// begin
      BF_en_3 <= 0;
   //end
   else begin
      if(valid) begin
         BF_en_3[0]<=cnt[5];
         BF_en_3[1]<=BF_en_3[0];
      end
   end
end

always@(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
      BF_en_4<=0;
   end
   else begin
      if(valid) begin
         BF_en_4[0]<=cnt[4];
         BF_en_4[2:1]<=BF_en_4[1:0]; 
      end
   end
end

always@(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
      BF_en_5<=0;
   end
   else begin
      if(valid) begin
         BF_en_5[0]<=cnt[3];
         BF_en_5[3:1]<=BF_en_5[2:0];    
      end
   end
end

always@(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
      BF_en_6<=0;
   end
   else begin
      if(valid) begin
         BF_en_6[0]<=cnt[2];
         BF_en_6[4:1]<=BF_en_6[3:0]; 
      end
   end
end

always@(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
      BF_en_7<=0;
   end
   else begin
         if(valid) begin
         BF_en_7[0]<=cnt[1];
         BF_en_7[5:1]<=BF_en_7[4:0]; 
      end
   end
end


assign BF_en_8 = ~ cnt[0];

assign re_data = {sample_re_data_out[Out_BW:Cut_BW]};
assign im_data = {sample_im_data_out[Out_BW:Cut_BW]};
endmodule
