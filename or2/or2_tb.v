`timescale 1s/100ms
`include "or2.v"

module or2_tb();
reg a;
reg b;
wire y;

or2 ior2(y,a,b);
initial
begin
    $monitor("a=%b, b=%b, y=%b",a,b,y);
    $dumpfile("wave.vcd");
    $dumpvars(0, or2_tb);
    a=0; b=0; #1;
    a=0; b=1; #1;
    a=1; b=0; #1;
    a=1; b=1; #1;
    $finish;
end

endmodule