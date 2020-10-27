//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
 
//// Create Date:    21:56:16 05/29/2019 
//// Design Name: 
//// Module Name:    Counter 
//// Project Name: 
//// Target Devices: 
//// Tool versions: 
//// Description: 

//// Dependencies: 

//// Revision: 
//// Revision 0.01 - File Created
//// Additional Comments: 

////////////////////////////////////////////////////////////////////////////////////
//module Counter # ( parameter Cnt = 10)
//	(clk, rst_n, start, valid, cnt, valid_out);
//	 input clk;
//	 input rst_n;
//	 input start;
//	 input valid;
//	 output reg [Cnt-1:0] cnt;
//	 output reg  valid_out;
	 
////	 integer clkcnt;
	 
////	 always@(posedge clk)
////         clkcnt = clkcnt +1;
         
////    initial begin
////    clkcnt = -103;
////    end
    
//	always@(posedge clk or negedge rst_n) begin
//		if(!rst_n) begin	      
//		           valid_out <= 0;      
//		      cnt <= 10'b1111111111;
//		end
		
//		else begin
//			if(start && valid)
//			    begin 
//				    if(cnt == 10'b1111111111) 
//				        begin
//					       cnt <= 0;
//					    end
//				    else 
//				        begin
//					       cnt <= cnt + 1'b1;
//					       if (cnt ==262) //389
//					        valid_out <= 1;
//					    end
//		         end
				
//			else begin
//				cnt <= 10'b1111111111;
//				valid_out <= 0; 
//                end
//		end
//	end
//endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: MSIS Lab. CBNU
// Engineer: Mohammed E. Elbtity
// 
// Create Date: 10/04/2019 10:28:15 AM
// Design Name: 12-Bits FFT
// Module Name: counter
// Project Name: LG Touch Screen Controller 
// Target Devices: ASIC
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
module Counter (
        input            clk,                               // System Clock 
        input            rst_n,                             // Reset 
        input            start,                             // Start operations
        input            valid,                             // Valid input value
        input            Done,                             
        output           valid_out,                         // Valid Output value (After the dalay of 69 cycles)
        output reg [9:0] cnt                               // Output counter value 
    );
    
    
        reg [1:0] state, nextstate;
        localparam S0 = 2'b00;
        localparam S1 = 2'b01;
        localparam S2 = 2'b10;
        localparam S3 = 2'b11;
   // parameter S4= 3'b100;
    
    // State register
    always @( posedge clk or negedge rst_n) begin 
        if (!rst_n) 
            state <= S0;
        else
            state <= nextstate  ;
    end
     
    
    // Next state logic 
    
   always @(*) 
         case (state)
             S0: if (start)              nextstate = S2;
                 else                    nextstate = S0;
//             S1: if (valid)               nextstate = S2;

               
             S2: if ( cnt== 10'b0100_0001_10)     nextstate = S3;     // nextstate = S1 (It was like this) 
                 else                              nextstate=S2;
                 
             
             S3:   if(Done)                nextstate = S0;
                   else                    nextstate = S3;
             default:                    nextstate = S0;
             
         endcase  
 
    

        /*   Output Logic */
          always @(posedge clk or negedge rst_n) begin  
                  
                  if (! rst_n)
                       cnt <= 10'b1111111111;
                  else if(state == S0)    
                       cnt <= 10'b0;//cnt = 10'b1111111111;
                  else if(state == S1)  begin  
                       cnt <= 10'b0;//cnt = 10'b1111111111;
                       if (valid)
                           cnt <= 10'b0;     
                   end
                       
                  else if ((state == S2)|(nextstate == S2)|(state == S3)) begin                  
                       if (valid) //trial
                           cnt <= cnt + 1; // trial
                   end
            end
               
 
        
        
    // Validout Signal Output Logic 
    assign valid_out = (state == S3 & valid); // ? valid_in: 1'b0 ; 
    
    
    
endmodule
