`timescale 1s/100ms
`include "and2.v"

module and2_tb();
reg a;
reg b;
wire y;

and2 iand2(a,b,y);
initial
begin
    $monitor("a=%b, b=%b, y=%b",a,b,y);
    $dumpfile("wave.vcd");
    $dumpvars(0, and2_tb);
    a=0; b=0; #1;
    a=0; b=1; #1;
    a=1; b=0; #1;
    a=1; b=1; #1;
    $finish;
end

endmodule

/*

 https://www.youtube.com/watch?v=rwVFDfy2xVI

iverilog -o code.out and2_tb.v && ./code.out && gtkwave wave.vcd

*/