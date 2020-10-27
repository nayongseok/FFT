`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/28 12:02:20
// Design Name: 
// Module Name: SPI_Slave
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


module SPI_Slave(
                    //SPI Interface
                MOSI,
                MISO,
                SCK,
                SS,
                
                //Parallel Interface
                tx_data,
                rx_data,
                spi_done,        //1-data is valid on rx_data and can be copied
                                                //0-shifting is in progress, rx_data contents are invalid
                //general inputs
                clk,
                rst_n
                );
 
parameter DWIDTH = 32;    //witdh of each SPI transfer
parameter SWIDTH = 8;    //Width of SCK witdh

//SPI Interface
input wire MOSI;
output reg MISO;
input wire SCK;
input wire SS;

//Parallel Interface
input wire [31:0] tx_data;
output reg [31:0] rx_data;
output reg spi_done;        //1-data is valid on rx_data and can be copied
                                //0-shifting is in progress, rx_data contents are invalid
//general inputs
input clk;
input rst_n;

reg [DWIDTH-1:0] tx_reg;
wire [DWIDTH-1:0] tx_mux;
reg [7:0] sck_cnt;
                        
reg SCK_prev;        //value of SCK during the previous cycle of HCLK

assign tx_mux = (sck_cnt ==0) ? tx_data : tx_reg;    //during first cycle use tx_data, afterwards use tx buffer (tx_reg)
always @ (posedge clk or negedge rst_n) begin        //SPI_reception
    if(~rst_n) begin
        tx_reg <= {(DWIDTH){1'b0}};
        sck_cnt <= {(DWIDTH){1'b0}};
        spi_done <=1'b0;
        MISO <= 1'b0;
        SCK_prev <= 1'b1;
        rx_data <= {DWIDTH{1'b0}}; 
    end else if(SS) begin    //Active low, if slave select is high (disable) 
        tx_reg <= {(DWIDTH){1'b0}};
        sck_cnt <= {(DWIDTH){1'b0}};
        spi_done <= 0;
        MISO <= 1'b0;
        SCK_prev <= 1'b1;
    end else begin
        if(SCK_prev && ~SCK) begin                 //falling edge on SCK, change MISO
            MISO <= tx_mux[32-sck_cnt[4:0]-1];
            spi_done <= 1'b0;
            
            if(sck_cnt == 'd0) begin
                tx_reg <= tx_data;
            end
        end else if (~SCK_prev && SCK)begin     //rising edge on SCK, sample MOSI
            rx_data[DWIDTH-sck_cnt-1] <= MOSI;
            
            //SCK counter
            if( sck_cnt == $unsigned(DWIDTH-1)) begin
                sck_cnt <= 8'd0;
                spi_done <= 1'b1;
            end else begin
                spi_done <= 1'b0;    
                sck_cnt <= sck_cnt + 1;
            end                
            
        end else begin
            spi_done <= 1'b0;    
        end
        SCK_prev <= SCK;
    end
end
endmodule