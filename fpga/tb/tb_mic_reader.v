`timescale 1ns/1ps
module tb_mic_reader();

reg clk = 1;

always #1 clk = ~clk;

reg miso = 1'bX;
wire nCs;
wire[15:0] readedData;
wire readedStrobe;



`define assert(signal, value) \
        if (signal !== value) $display("ASSERTION FAILED in %m: signal != value"); \
        else $display("ASSERTION SUCCEEDED in %m: signal = value"); \

mic_reader readerInstance(
    .clk(clk),
    .nCs(nCs),
    .miso(miso),
    .outData(readedData),
    .outStrobe(readedStrobe)
);

integer csCount = 0;
always @(negedge nCs)
    #0.1 csCount <= csCount + 1;

reg [15:0] txData;

always @(negedge clk) begin
    miso <= txData[14];
    if (nCs) begin
        if (csCount==1) txData <= 16'hFABB;
        if (csCount==2) txData <= 16'hC792;
    end else begin
        txData <= (txData << 1);
    end
end

initial begin
    $dumpfile("out.vcd");
    $dumpvars;

    @(posedge readedStrobe);
        #1.1  
    @(posedge readedStrobe);  
        `assert(readedStrobe, 1'b1);
    @(negedge readedStrobe);
        `assert(readedData, 16'h7ABB);
        #1.1
    @(posedge readedStrobe);  
        `assert(readedStrobe, 1'b1);
    @(negedge readedStrobe);
        `assert(readedData, 16'h4792);
        #1.1


    

    $finish;
end

endmodule
