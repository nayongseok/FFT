`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/03 19:16:20
// Design Name: 
// Module Name: TOP_2
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


module TOP_2      #(        parameter In_BW = 12, //IWIDTH //input data size
                            parameter BW = 16,
                            parameter DW = 32,  
                            parameter DWIDTH = 32,                                  //Memory width and SPI data format
                            parameter in_DEPTH = 256,
                            parameter out_DEPTH = 264,
                            parameter in_ADDR_W = $clog2(in_DEPTH),
                            parameter out_ADDR_W = $clog2(out_DEPTH)  
                           )(
    //SPI Interfave
    input MOSI,
    input SCK,
    input nSS,
    input clk,rst_n,//valid_in,
    output MISO,

     /* FFT Interfaces */
                               
     input  [in_ADDR_W-1:0]  in_mem_address,                      // In_mem address port
     input  [out_ADDR_W-1:0] out_mem_address,                     // Out_mem address port
     input  [DW-1:0]         fft_out_mem_wr_data,                // From the FFT outputs to the output Memory
     output [DW-1:0]         fft_in_mem_rd_data,                 // From the input Memory to the FFT input  
     input                   fft_rd,fft_wr                       // FFT read and Write enable signals (Active HIGH)
    );
    
    reg [DWIDTH-1:0] tx_data; // tx_data
    wire [DWIDTH-1:0] rx_data; // rx_data
    wire spi_done;
    reg             spi_status;  
    reg   [DW-1:0]  aphase_rxbuff; 
    wire  [DW-1:0]  rd_data_mem;
    wire  [DW-1:0]  wr_data_mem;
    wire wr_en;
    wire rd_en;
    wire mem_en;
    wire [DWIDTH-1:0] addr_mem;
    
//    wire            wr_en_sig;

     wire [31:0] spi_data_out;
     wire spi_rd_en;
     wire [7:0] ir_addr;
     
     wire [31:0] ir_data;
     
     wire [8:0] or_addr;
     wire [31:0] or_data;
     wire or_rd_en;
     
//     wire [31:0]out_test_data;
//     wire wr_en_test;

  // SPI Phases Handling (Address phase and Data Phases)
  always @(posedge clk or negedge rst_n) begin 
    
        if (!rst_n) begin 
            spi_status <= 1'b0; 
            aphase_rxbuff <= 'd0; 
        end
        
        else if (nSS) begin 
            spi_status <= 1'b0;
        end    
        
        else begin 
        
            if (spi_done) begin                         // SpI Transfer has been done 
                if (! spi_status) begin 
                    aphase_rxbuff <= rx_data;
                    spi_status <=1'b1; 
                end // if spi_status
            end    // spi_done
         end    //else 
     end        //always 
  
  
  
  // Memory control signals 
  
  assign addr_mem = ((~spi_status) && (spi_done)) ? rx_data[DW-1:0] : aphase_rxbuff; 
  
//  assign tx_data = rd_data_mem; 
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            tx_data <= {(DWIDTH-1){1'b0}};
        end
        else begin
            if (mem_en) begin
                if(rd_en) begin
                    tx_data <= rd_data_mem;/////////////////////////
                end else if (wr_en) begin
                    tx_data <= "w_ok";
                end
            end
            
        end
    end
  
  assign wr_data_mem = rx_data; 
  assign wr_en = (addr_mem[DW-1]) && spi_done && spi_status;                      // addr_mem[32] is W/R bit , 0 => Read ,,,, while 1 => Write
  
  assign rd_en =  (! (addr_mem[DW-1])) && spi_done && (! spi_status);
  
  assign mem_en = spi_done; 
  

//  assign wr_en_sig = wr_en && spi_done;
  //assign rd_en_sig = rd_en

  ////////////////////////////////////////////////////////////////SPI_Slave///////////////////////////////////////////////////////////////
    SPI_Slave #(.DWIDTH(DW), .SWIDTH(8)) SPI_Slave ( //SPI Interface
                 .MOSI(MOSI),            //
                 .MISO(MISO),            //
                 .SCK(SCK),          //
                 .SS(nSS),           //     
                  //Parallel Interface
                 .tx_data(tx_data),       //
                 .rx_data(rx_data),       //
                 .spi_done(spi_done),     //    
                 .clk(clk),               //
                 .rst_n(rst_n)             //
                                     );
     ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                                 
    addr_tr qaddr_tr(
                     .mem_en(mem_en),
                     .wr_en(wr_en),
                     .rd_en(rd_en),
                     .wr_data_mem(wr_data_mem),
                    .addr_mem(addr_mem[DWIDTH-1:0]),
                    .rd_data_mem(rd_data_mem),
                    ///////////////////////////////////
                    .spi_data_out(spi_data_out),
                     .spi_rd_en(spi_rd_en),
                    .ir_addr(ir_addr),
                     .ir_data(ir_data),
                    ////////////////////////////////////
                    .or_data(or_data),
                    .or_addr(or_addr),
                    .or_rd_en(or_rd_en)
//                    .out_test_data(out_test_data),
//                    .wr_en_test(wr_en_test)
    
                        );
     /////////////////////////////////////////////////////////////INPUT BUFFER//////////////////////////////////////////////////////////////////////
     INPUT_RAM INPUT_RAM(
                       .clk(clk),                              //
                       .rst_n(rst_n),                          //
                       .wr_en(wr_en),                      //
                       .rd_en(fft_rd),                        //
                       .lft_address(ir_addr),   //addr_mem[in_ADDR_W-1:0]
                       .rgt_address(in_mem_address),               //  
                       .data_in(ir_data),                    //wr_data_mem
                       .data_out(fft_in_mem_rd_data),                        //
                       .spi_data_out(spi_data_out),
                       .spi_rd_en(spi_rd_en)
                        );
      ///////////////////////////////////////////////////////////////////OUTPUT BUFFER///////////////////////////////////////////////////////////////////       
      OUTPUT_RAM OUTPUT_RAM( 
                      .clk(clk),                                //
                      .rst_n(rst_n),                            //
                      .wr_en(fft_wr),                         //////////////////////////////////////////fft_wr
                      .rd_en(or_rd_en),                         //
                      .rgt_address(or_addr),    //addr_mem[out_ADDR_W-1:0]
                      .lft_address(out_mem_address), //аж╪р        ///////////////////////////////////out_mem_address
                      .data_in(fft_out_mem_wr_data),// real data in      ///////////////////////////////////fft_out_mem_wr_data
                      .data_out(or_data) //out                // rd_data_mem  
                       );
endmodule
