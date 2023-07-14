/* 
iverilog -o ir.out ir_control.v ir_control_tb.v && ./ir.out && gtkwave wave.vcd 
*/

`timescale 1ns/100ps

module ir_control_tb;
  reg clk_tb, rst_tb, irda_tb;

  ir_control uut (.clk(clk_tb), .rst(rst_tb), .irda(irda_tb));
  
  initial 
  begin
    $monitor("rst_tb=%b",rst_tb);
    $dumpfile("wave.vcd");
    $dumpvars(0, ir_control_tb);
  
    clk_tb = 0;
    rst_tb = 0;
    irda_tb = 1;
    
    #10
    rst_tb = 1;
    
    #50
    rst_tb = 0;
    
    #30
    irda_tb = 1;
    
    #80
    irda_tb = 0;
    
    #40
    irda_tb = 1;
    
    #30
    irda_tb = 0;
    
    #50
    irda_tb = 1;
    
    #20
    irda_tb = 0;
    
    #90
    irda_tb = 1;
    
    #30
    irda_tb = 0;
    
    #200
    $finish;
    
  end
  
  always #5 clk_tb = ~clk_tb;

endmodule