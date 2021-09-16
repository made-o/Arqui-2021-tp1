`timescale 1ns / 1ps
module Tp1_tb_auto();
  
  //Local parameters:
  localparam nbits   = 8;
  localparam nBitsOp = 6;
    
  // Entradas:
  reg clk;
  reg signed  [nbits-1:0]   operando_A;    // registro A
  reg signed  [nbits-1:0]   operando_B;    // registro B
  reg signed  [nBitsOp-1:0] cod_operacion; // la operacion a realizar
     
  // Salidas:
  wire signed [nbits-1:0]  ALU_Result;   // ALU Output 
  
  // TB signals
  
  integer index_op;
  
  reg [nBitsOp-1:0] cod_op_array [nbits-1:0];
  
  wire [nbits-1:0] dato_result;
  
  reg  test_start;
  
  initial begin
    clk = 1'b0;
    operando_A = 8'b0;
    operando_B = 8'b0;
    cod_operacion = 6'b0;
    test_start = 1'b0;
    index_op = 0;
    
    cod_op_array [0] = 6'b100000 ; // suma
    cod_op_array [1] = 6'b100010 ; // resta
    cod_op_array [2] = 6'b100100 ; // AND
    cod_op_array [3] = 6'b100101 ; // OR
    cod_op_array [4] = 6'b100110 ; // XOR
    cod_op_array [5] = 6'b000011 ; // SRA
    cod_op_array [6] = 6'b000010 ; // SRL 
    cod_op_array [7] = 6'b100111 ; // NOR
    
    $dumpfile("dump.vcd"); 
    $dumpvars;
    
    #100
    
    test_start = 1'b1;
    
    #1000;
    
    $display("############# Test OK ############");
    $finish();
  end
  
  //Module instance 
   ALU
    #(
      .NBITS (nbits),
      .COD_OP (nBitsOp)
     )
    ALU
    (
      	.operando_A    (operando_A),
      	.operando_B    (operando_B),
      	.cod_operacion (cod_operacion),
      	.ALU_Result    (ALU_Result)
    );
  
  
  // Clock generation
  always #10 clk = ~clk;
 
  //Random Data
  always @(posedge clk)
  begin
    operando_A <= $urandom() % 100;
    operando_B <= $urandom() % 100;
    cod_operacion <= cod_op_array[index_op];
    if(index_op < 7)begin
    	index_op <= index_op + 1; 
    end else begin
      index_op <= 0;
    end
  end
	
 // Check Module Output 
  always @(posedge clk)
  begin
    if(test_start)
    begin
      case(cod_operacion)
        
        6'b100000:
          begin
            if(dato_result != (operando_A + operando_B))
            begin
              $error("Error en la Suma!");
              $display("############# Test Suma FALLO ############");
              $finish();
            end
          end
        
        6'b100010:
          begin
            if(dato_result != (operando_A - operando_B))
            begin
              $error("Error en la Suma!");
              $display("############# Test Resta FALLO ############");
              $finish();
            end
          end
        
        6'b100100:
          begin
            if(dato_result != (operando_A & operando_B))
            begin
              $error("Error en la Suma!");
              $display("############# Test AND FALLO ############");
              $finish();
            end
          end
        
        6'b100101:
          begin
            if(dato_result != (operando_A | operando_B))
            begin
              $error("Error en la Suma!");
              $display("############# Test OR FALLO ############");
              $finish();
            end
          end
        
        6'b100110:
          begin
            if(dato_result != (operando_A ^ operando_B))
            begin
              $error("Error en la Suma!");
              $display("############# Test XOR FALLO ############");
              $finish();
            end
          end
        
        6'b000011:
          begin
            if(dato_result != (operando_A >>> operando_B))
            begin
              $error("Error en la Suma!");
              $display("############# Test >>> FALLO ############");
              $finish();
            end
          end
        
        6'b000010:
          begin
            if(dato_result != (operando_A >> operando_B))
            begin
              $error("Error en la Suma!");
              $display("############# Test >> FALLO ############");
              $finish();
            end
          end
        
        6'b100111:
          begin
            if(dato_result != (~(operando_A | operando_B)))
            begin
              $error("Error en la Suma!");
              $display("############# Test NOR FALLO ############");
              $finish();
            end
          end
        
      endcase
    end
  end
 
endmodule
