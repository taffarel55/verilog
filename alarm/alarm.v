module alarm (clk, rst, remote, sensors, siren);
  input clk, rst, remote, sensors;
  output reg siren;
  
  // Registradores de estado
  reg [2:0] state;
  
  // Codificação dos estados
  parameter a   = 3'b000,
            at  = 3'b001,
            b   = 3'b010,
            bt  = 3'b011,
            c   = 3'b100;

  initial 
  begin
    state <= a;
  end
  
  // Primeiro procedimento - Definicão próximo estado
  always @(negedge clk, negedge rst) 
  begin
    if(rst == 1'b0) state <=a;
    else begin
      case(state)
        a:begin
          if (remote == 1'b0) state <= a;
          else state <= at;
        end

        at:
        begin
          if(remote == 1'b1) state <= at;
          else state <= b;
        end

        b:
        begin
          if(sensors == 1'b1) state <= c;
          else if(remote == 1'b1) state <= bt;
          else state <= b;
        end

        bt:
        begin
          if(remote == 1'b1) state <= bt;
          else state <= a;
        end

        c:
        begin
          if(remote == 1'b0) state <= c;
          else state <= bt;
        end
      endcase
    end
  end
  
  always @(state) begin
    case(state)
      a:  siren = 1'b0;
      at: siren = 1'b0;
      b:  siren = 1'b0;
      bt: siren = 1'b0;
      c:  siren = 1'b1;
    endcase
  end
    
endmodule