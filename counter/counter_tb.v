/*
iverilog -o counter.out counter.v counter_tb.v && ./counter.out && gtkwave wave.vcd 
*/

module counter_tb;

  reg clk;
  reg u;
  reg SS;
  reg [3:0] cnt;
  counter test (clk,u,SS,cnt);

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, counter_tb);
    
    clk = 0;
    u = 0;
    SS = 1;
    cnt = 0;  // Initialize cnt

    #100
    $finish;
  end
  always @(posedge clk) begin
    $display("Contador: %b", cnt);
  end
  always #50 u = ~u;
  always #5 clk = ~clk; 
endmodule