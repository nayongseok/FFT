`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/04 11:14:16
// Design Name: 
// Module Name: tb_TOP_3
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


module tb_TOP_3();
    parameter DWIDTH = 32;  //width of each SPI transfer
    //SC Conv x4  Signals
    wire MISO, MOSI, nSS, SCK;
    
    //global signals
    reg clk, clkS, rst_n;
    
    //SPI Master
    reg [DWIDTH-1:0] addr;
    reg [DWIDTH-1:0] wr_data;  //transmit data
    reg [DWIDTH-1:0] addr_nxt;
    reg [DWIDTH-1:0] wr_data_nxt;  //transmit data
    wire [DWIDTH-1:0] rd_data; //received data
    wire [DWIDTH-1:0] rd_sig; //received signature from slave
    wire [7:0] SCK_div;
    
    //SPI Testing Signals
    reg spi_valid_data;
    reg spi_valid_data_p1;
    integer state_cnt_p1;
    
    reg spi_start;
    wire busy;
    wire spi_done;   //done flag after sending/recieving data
    reg [7:0] spi_done_pre;
    integer state_cnt; 
    reg spi_complete;  //SPI Write/Read operation has been completed 
    
    reg start;
    reg valid_in;
    wire Done;                     //FFT_Done
    reg [11:0] test_input [0:255]; //12bit 256addr
    
    //Clock / Reset Generation
    always #10 clk= ~clk;
    always #9.99 clkS= ~clkS;
    //initializing clock and reset
    initial begin
    
        //force tb_TOP.top.CNN.resultlayer.mem[0] = 8'h2c;
        clk = 1'd0;
        clkS = 1'd0;
        rst_n = 1'd0;
        start = 1'b0;
        valid_in = 1'b0;
        $readmemh("C:/Users/나용석/Desktop/FFT_256point/Data_re_256_in.txt",test_input);
        #90;
        rst_n = 1'd1;
        #2750000;
//        start = 1'b1;
        start = 1'b1;
        #20;
        valid_in = 1'b1;
        
        #20;
        start = 1'b0;
        #500000;
        start = 1'b1;
        valid_in = 1'b0;
        #40;
        start = 1'b0;
    end
    
    //SPI Read Write Operation Test    
    assign SCK_div = 8'd1;
    always@(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            spi_start <= 1'b0;
            state_cnt <= 0;
            spi_valid_data_p1 = 0;
            state_cnt_p1 <= 'd0;
            addr        <= 'd0;
            wr_data     <= 'd0;
            spi_done_pre <= 8'b00000000;
            spi_complete <= 1'b0;
        end else begin
            if((spi_done_pre[7] ~^ spi_valid_data_p1) || (state_cnt<=1)) begin
                spi_valid_data_p1   <= spi_valid_data;
                spi_start   <= spi_valid_data;
                addr        <= addr_nxt;  
                wr_data     <= wr_data_nxt;
                state_cnt_p1 <= state_cnt;                                  //일반적인 clk의 개수와는 다름.
                if(state_cnt <= 100000) begin
                    state_cnt <= state_cnt +1;
                end else begin
                    spi_complete <= 1'b1;
                //    state_cnt <= 'd5;
                end
            end else begin
                spi_start <= 1'b0;
            end
            spi_done_pre <= {spi_done_pre[6:0], spi_done};
        end
    end
    
    reg [7:0] in_Addr;//weight1

    reg [8:0] out_Addr;//weight1
    
    always @(state_cnt or negedge rst_n) begin
        if( !rst_n ) begin
            in_Addr <= 0;
            out_Addr <= 0;
        end
        else begin
            if(state_cnt <= 256) begin  //256
                if(in_Addr == 8'd255) begin
                    in_Addr <= 0;
                end
                else begin
                    in_Addr <= in_Addr + 1;
                end
            end
            
            else if(state_cnt>2032 && state_cnt<=2360) begin
                 if(out_Addr == 9'd263) begin
                     out_Addr <= 0;
                 end
                 else begin
                      out_Addr <= out_Addr + 1;
                 end
           end
           
           else begin
           end
        end
    end
    
    always @(state_cnt or negedge rst_n)
    begin
        if( !rst_n ) begin
            addr_nxt <= 0;
            wr_data_nxt <= 0;
            spi_valid_data <= 0;
        end
        else begin
            if(state_cnt <= 256) begin
                addr_nxt <= {1'b1,23'b0,in_Addr}; //[31 , 30~11, 10~9, 8~7, 6, 5~0
                wr_data_nxt <= {20'b0,test_input[state_cnt-1]};
                spi_valid_data <= 1'b1;  
            end
            else if((state_cnt > 512) && (state_cnt <= 2032)) begin
                addr_nxt <= {1'b0,31'd0};
                wr_data_nxt <= 32'd0;
                spi_valid_data <= 1'b0;            
            end
//            else if((state_cnt>2032) && (state_cnt<=2296)) begin               //write
//                addr_nxt <= {1'b1,21'b0,1'b1,out_Addr};
//                wr_data_nxt <= {20'b0,test_input[state_cnt-2033]};
//                spi_valid_data <= 1'b1;
//            end
            else if((state_cnt >= 2032) && (state_cnt <= 2296)) begin
                addr_nxt <= {1'b0,21'b0,1'b1,out_Addr};
                spi_valid_data <= 1'b1;                
            end
            
//            else if(state_cnt == 2034) begin
//                addr_nxt <= {1'b0,21'b0,1'b1,9'b000000001};
//                spi_valid_data <= 1'b1;                
//            end
//            else if(state_cnt == 2035) begin
//                addr_nxt <= {1'b0,21'b0,1'b1,9'b100000001};
//                spi_valid_data <= 1'b1;                
//            end
//            else if(state_cnt == 2036) begin
//                addr_nxt <= {1'b0,21'b0,1'b1,9'b100000100};
//                spi_valid_data <= 1'b1;                
//            end
            else begin
                addr_nxt <= 32'd0;
                spi_valid_data <= 1'b0;
            end
        end
    end

//////////////////////////////////////////////////////////////////////////////////////////////////////////

    //SPI Read Verification Test
    always@(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
        end else begin
            if(spi_done) begin
                //$write("\nState_cnt value is : %3d - ", state_cnt_p1);
                if(!addr[31]) begin                //value was read
                    $display("%3d) --Read value from mem[%3d]: %3d (\"%s\")", state_cnt_p1, addr[30:0], rd_data, rd_data);
                end
            end
        end
    end
    
    Master_Top SPIMT(
    
    .MISO(MISO),         //Master .Slave output
    .SS(nSS),     //slave select
    .SCK(SCK),    //.clock
    .MOSI(MOSI),   //Mater .Slave input
    
    //parallel interface
    .addr(addr),
    .wr_data(wr_data),  //transmit data
    .rd_data(rd_data), //received data
    .rd_sig(rd_sig), //received data
    .start(spi_start),
    .busy(busy),
    .done(spi_done),   //done flag after sending/recieving data
    
    //clock divider value
    .SCK_div(8'd3),    //f_SCK = f_clk/(2*(SCK_div+1))
    
    //general inputs
    .clk(clk),        .rst_n(rst_n)
    );
    
    
    TOP_3 TOP_3(
    
    .MOSI(MOSI),
    .MISO(MISO),
    .SCK(SCK),
    .nSS(nSS),

    .start(start),
    .valid_in(valid_in),
    .Done_FFT(Done),
    
    .clk(clk),
    .rst_n(rst_n)
    );
    

endmodule