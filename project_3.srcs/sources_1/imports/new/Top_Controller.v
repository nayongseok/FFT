`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 16:30:51
// Design Name: 
// Module Name: Controller_FFT_200221
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


module Top_Controller #(parameter Addr_Cnt = 8)
    (
    //input
    input clk, rst_n,
    input Start,
    input valid_in,
    input valid_out,
    //output
    output reg Start_FFT,      //if Yong-Suk doesn't use this value, You can remove this value.
    output reg valid_in_FFT,
    output reg valid_in_Buff,
    output reg valid_out_Buff,
    output reg Done,
    output reg [Addr_Cnt-1:0] In_Buff_Addr,
    output reg [Addr_Cnt:0] Out_Buff_Addr
    );
    wire [Addr_Cnt-1:0] in_Addr;
    wire [Addr_Cnt:0] out_Addr;
    wire [Addr_Cnt:0] Re_Order_Addr;
    wire [Addr_Cnt:0] Origin_Addr;

    
    assign Re_Order_Addr = {out_Addr[8],out_Addr[0],out_Addr[1],out_Addr[2],out_Addr[3],out_Addr[4],out_Addr[5],out_Addr[6],out_Addr[7]};
    assign Origin_Addr = out_Addr;
//    assign valid_in_Buff = valid_in;
//    assign valid_out_Buff = valid_out;
//    assign Start_FFT = Start;
    
    reg [2:0] State, Next_State;
    
    localparam S_1st = 3'b000;
    localparam S_2nd = 3'b001;
    localparam S_3rd = 3'b010;
    localparam S_4th = 3'b011;
    localparam S_5th = 3'b100;
    localparam S_6th = 3'b101;

    
    Start_counter # (.Cnt(Addr_Cnt)) In_Buff_Counter (.clk(clk), .rst_n(rst_n), .valid_in(valid_in), .cnt_start(in_Addr));//start_d,
    Done_counter # (.Cnt(Addr_Cnt)) Out_Buff_Counter (.clk(clk), .rst_n(rst_n), .valid_out(valid_out_Buff), .done_cnt(out_Addr));
 
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)
            State <= S_1st;
        else
            State <= Next_State;
    end



    always @ (*)
        case(State)
        //S_1st - IDLE (Start = 1 >> S_2nd / S_1st)
        S_1st : begin
                    if(Start) Next_State = S_2nd;
                    else Next_State = S_1st;
                end
        //S_2nd - Read Input memory (In_Buff_Addr = 63/255 >> S_2nd / S_1st)
        S_2nd : begin
                    if(In_Buff_Addr == 8'b11111111) Next_State = S_3rd;
                    else Next_State = S_2nd;
                end      
        //S_3rd - Waiting Valid_out (Valid_out = 1 >> S_4th / S_3rd)  
        S_3rd : begin
                   if(valid_out == 1'b1) Next_State = S_4th;
                   else Next_State = S_3rd;
                end     
        //S_4th - Write Output memory (Out_Buff_Addr = 63/255 >> S_5th / S_4th)
        S_4th : begin
                   if(Out_Buff_Addr == 9'b011111111) Next_State = S_5th;  // 무슨 7bit의 값이 되어야 Done 신호가 나오는지 모르기에 표시
                   else Next_State = S_4th;
                end  
        S_5th : begin
                   if(Out_Buff_Addr == 9'b100000111) Next_State = S_6th;  // 무슨 7bit의 값이 되어야 Done 신호가 나오는지 모르기에 표시
                   else Next_State = S_5th;
                end  
        //S_6th - Process is Done (Done = 1 >> S_1st / S_6th)
        S_6th : begin
                   if(Start == 1'b1) Next_State = S_1st;
                   else Next_State = S_6th;
                end    
        default : Next_State = S_1st;
        endcase
        
    always @ (posedge clk or negedge rst_n) begin 
        if(!rst_n) begin
            Done <= 0;
            valid_in_Buff <= 0;
            valid_out_Buff <= 0;
            valid_in_FFT <=0;
            In_Buff_Addr <= 0;
            Out_Buff_Addr <= 0;
            Start_FFT <= 0;
        end
        
        else if(State == 3'b000) begin
            Start_FFT <= Start;                     //if Yong-Suk doesn't use this value, You can remove this value.
            valid_in_Buff <= valid_in;
            valid_in_FFT <= valid_in;
            valid_out_Buff <= 0;
            Done <= 0;
            In_Buff_Addr <= 0;
            Out_Buff_Addr <= 0;
        end
        else if (Next_State==3'b001) begin 
            Start_FFT <= Start;      
            valid_in_Buff <=valid_in; 
            valid_in_FFT <= valid_in;  
            In_Buff_Addr <=  in_Addr;
        end
        else if (Next_State==3'b010) begin   //이 아래로는 조건에서 만일 둘중 하나가 좀더 빠르게 나온다면 그 타이밍을 보고 둘줄 어떤걸 쓸지 판단
            valid_out_Buff <= valid_out;
            In_Buff_Addr <= in_Addr;
            valid_in_Buff <= 0;
            Out_Buff_Addr <= Re_Order_Addr;
        end
        else if (Next_State==3'b011) begin   //이 아래로는 조건에서 만일 둘중 하나가 좀더 빠르게 나온다면 그 타이밍을 보고 둘줄 어떤걸 쓸지 판단
            valid_out_Buff <= valid_out;
            Out_Buff_Addr <= Re_Order_Addr;  //외부에 넣어 줄 때는 0.reorder address 형태로 
        end
        else if (Next_State==3'b100) begin   //이 아래로는 조건에서 만일 둘중 하나가 좀더 빠르게 나온다면 그 타이밍을 보고 둘줄 어떤걸 쓸지 판단
            Out_Buff_Addr <= Origin_Addr;  //외부에 넣어 줄 때는 0.reorder address 형태로 
        end
        else if ((Next_State==3'b101)) begin   //이 아래로는 조건에서 만일 둘중 하나가 좀더 빠르게 나온다면 그 타이밍을 보고 둘줄 어떤걸 쓸지 판단
            valid_in_Buff <= 0;
            valid_in_FFT <= 0;
            valid_out_Buff <= 0;
            Done <= 1'b1;
            Out_Buff_Addr <= 9'b000000000;
        end
    end
endmodule