//`timescale 1ns / 1ps

module Top 
#(  // Parámetros:
    parameter NBITS  = 8, // bits de entrada (switches)
    parameter COD_OP = 6
)
(   // Entradas:
    input wire              clk,       // Clock
    input wire              btn_Reset, // Botón de reset de entradas y cógido de operación
    input wire [2:0]        pulsador,  // Son los switches que eligen si se ingresan datos o una operacion
    input wire [NBITS-1:0]  entrada,   // Bus de entrada que muestra los operandos o el codigo de operacion
    
    // Salidas:
    output wire [NBITS-1:0] ALU_Out   // Salida del resultado
);
    
    // Variables internas:
    reg [NBITS -1:0] inA;    // Registro de entrada que almacena el operando A
    reg [NBITS -1:0] inB;    // Registro de entrada que almacena el operando B
    reg [COD_OP-1:0] cod_op; // Registro que almacena el codigo de la operacion
    
    
    // Cosas que faltan:
        // Bloque que guarda los operandos y la operación en los registros auxiliares.
        // Lo hace sincronicamente
    always  @(posedge clk)
    begin : seleccion
        case(pulsador)
            3'b001 : inA   = entrada;
            3'b010 : inB   = entrada;
            3'b100 : cod_op = entrada[5:0];  //El codigo de operacion solo ocupa los 6 bits menos significativos del bus de entrada
            default : cod_op = 6'b000000;
        endcase
        
        if(btn_Reset) // Reseteo de entradas y código de operación:
        begin
            inA    <= {NBITS {1'b0}};
            inB    <= {NBITS {1'b0}};
            cod_op <= {COD_OP{1'b0}};
        end
    end
    
    
    // Instancio al módulo de la ALU:
    ALU alu_0 ( 
        .operando_A(inA),
        .operando_B(inB),
        .cod_operacion(cod_op),
        .ALU_Result(ALU_Out) 
    );
    
endmodule // Top_module
