/* 
iverilog -o alarm.out alarm.v alarm_tb.v && ./alarm.out && gtkwave wave.vcd 
*/

`timescale 1ns/100ps

module alarm_tb;
  reg clk_tb, rst_tb, remote_tb, sensors_tb;
  wire siren_tb;

  alarm uut (.clk(clk_tb), .rst(rst_tb), .remote(remote_tb), .sensors(sensors_tb), .siren(siren_tb));
  
  initial 
  begin
    $monitor("rst_tb=%b",rst_tb);
    $dumpfile("wave.vcd");
    $dumpvars(0, alarm_tb);
  
    clk_tb = 0;
    rst_tb = 1;
    remote_tb = 0;
    sensors_tb = 0;
    
    #10
    rst_tb = 0;
    
    #50
    rst_tb = 1;
    
    #30
    remote_tb = 1;
    
    #80
    remote_tb = 0;
    
    #40
    remote_tb = 1;
    
    #30
    remote_tb = 0;
    
    #50
    remote_tb = 1;
    
    #20
    remote_tb = 0;
    
    #80
    sensors_tb = 1;
    
    #20
    sensors_tb = 0;
    
    #90
    remote_tb = 1;
    
    #30
    remote_tb = 0;
    
    #200
    $finish;
    
  end
  
  always #5 clk_tb = ~clk_tb;

endmodule