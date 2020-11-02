/* EXECUTE:
iverilog -o tb ffd_tb.v && ./tb && gtkwave wave.vcd
*/

`include "ffd.v"

module ffd_tb;
    reg d,rst,clk;
    wire q;
    
    // Port map
    ffd iffd(d,rst,clk,q);

    // Generate clock
    always #10 clk=~clk;

    // Testcase
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, ffd_tb);

        clk <= 0;
        d   <= 0;
        rst <= 1;

        #150 d <= 1;
        #120 d <= 0;

        rst <= 0;
        #100 d <= 1;
        #140 d <= 0;
        $finish;
    end

endmodule