`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/07 20:21:04
// Design Name: 
// Module Name: addr_tr
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


module addr_tr( 
                input mem_en,
                input wr_en,
                input rd_en,
                input [31:0] wr_data_mem,
                input [31:0] addr_mem,
                output reg [31:0] rd_data_mem,
                ///////////////////////////////////
                input [31:0] spi_data_out,
                output spi_rd_en,
                output [7:0] ir_addr,
                output [31:0] ir_data,
                ////////////////////////////////////
                input [31:0] or_data,
                output [8:0] or_addr,
                output or_rd_en

//output [31:0] out_test_data,
//output wr_en_test
);

                assign spi_rd_en = (mem_en == 1 && rd_en == 1 && addr_mem[9] == 0) ? rd_en : 0;
                assign or_rd_en = (mem_en == 1 && rd_en == 1 && addr_mem[9] == 1) ? rd_en : 0;
                assign ir_addr = (mem_en == 1 && (rd_en == 1 || wr_en == 1) && addr_mem[9] == 0) ? addr_mem[7:0] : 0;
                assign ir_data = (mem_en == 1 && wr_en == 1 && addr_mem[9] == 0) ? wr_data_mem : 0; //assign ir_data = (mem_en == 1 && wr_en == 1 && addr_mem[9] == 0) ? wr_data_mem : 0;
                assign or_addr = (mem_en == 1 && rd_en == 1 && addr_mem[9] == 1) ? addr_mem[8:0] : 0;
                
                //assign out_test_data = (mem_en ==1 && wr_en ==1 && addr_mem[9]==1) ?  wr_data_mem : 0;
                //assign wr_en_test = (mem_en == 1 && wr_en == 1 && addr_mem[9] == 1) ? wr_en : 0;

                always @ (*)
                begin
                    if(mem_en)
                    begin
                        if(rd_en)
                        begin
                            case(addr_mem[9])
                                0 : begin
                                    rd_data_mem = spi_data_out;
                                end
                                1 : begin
                                    rd_data_mem = or_data;
                                end
                            endcase
                        end
                        else
                        begin
                            rd_data_mem = 0;
                        end
                    end
                    else
                    begin
                        rd_data_mem = 0;
                    end
                end

endmodule
