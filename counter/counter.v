module counter(
  input wire clk,
  input wire u,
  input wire SS,
  output reg [3:0] cnt
);

  reg [3:0] ant;

  always @(posedge clk) begin
    if (SS) begin
      if (u == 1'b0) begin
        if (cnt == 4'b1001) begin
          ant <= 4'b0000;  
        end else begin
          ant <= cnt + 1;  
        end
      end else begin
        if (cnt == 4'b0000) begin
          ant <= 4'b1001;  
        end else begin
          ant <= cnt - 1;  
        end
      end
    end else begin
      ant <= cnt;  
    end
  end

  always @(posedge clk or posedge SS) begin
    if (SS) begin
      cnt <= ant;  
    end
  end

endmodule