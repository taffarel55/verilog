module ir_control (clk, rst, irda);
  input clk, rst, irda;
  integer count;
  
  // Registradores de estado
  reg [2:0] state;
  
  // Codificação dos estados
  parameter s0 = 3'b000,
            s1 = 3'b001,
            s2 = 3'b010,
            s3 = 3'b011;

  reg [2:0] buttons = 3'b000;

  initial 
  begin
    state <= s0;
  end
  
  // Primeiro procedimento - Definicão próximo estado
  always @(negedge clk, posedge rst) 
  begin
    if(rst == 1'b1) state <= s0;
    else begin
      case(state)
        s0:
        begin
          if (irda == 1'b1) state <= s0;
          else state <= s1;
        end

        s1:
        begin
          state <= s2;
        end

        s2:
        begin
          if (count < 10) 
            state <= s2;
          else 
            state <= s3;
        end
      endcase
    end
  end
  
  always @(state or negedge clk) begin
    case(state)
      s0: count = 32'bx;
      s1: count = 0;
      s2: count = count + 1;
      s3: buttons = irda << 2;
    endcase
  end
    
endmodule