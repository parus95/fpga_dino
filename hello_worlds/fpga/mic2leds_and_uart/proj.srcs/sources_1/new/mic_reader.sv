module MicReader (
    input wire clk,
    input wire miso,
    output wire cs,

    output reg [15:0] outData,
    output reg outStrobe
);
    parameter
        width = 32,
        divider = 114;
    //divider = 5000000;
    
    
    reg[(width-1):0] counter = 0;
    
    always @(posedge clk)
        if (counter == (divider - 1))
            counter <= 0;
        else
            counter <= counter + 1;
    
    wire
        active = counter < 16,
        strobe = counter == 16;
    
    assign cs = ~active;
    
    reg [15:0] shr;
    reg outStrobe;

 
    always @(posedge clk) begin
        if (active)
            shr <= {shr, miso};
        
        outStrobe <= strobe;
        if (strobe) begin
            outData <= shr >> 1;
        end
    end
endmodule

