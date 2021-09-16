`timescale 1ns / 1ps

`define OPA 3'b001  //Guarda lo que estaba en la entrada como el operador A
`define OPB 3'b010  //Guarda lo que estaba en la entrada como el operador B
`define COD 3'b100  //Guarda lo que estaba en la entrada como el c骴igo de operaci髇  

module Top 
#(  // Par谩metros:
    parameter NBITS  = 8, // bits de entrada (switches)
    parameter COD_OP = 6
)
(   // Entradas:
    input wire              clk,       // Clock
    input wire              btn_Reset, // Bot贸n de reset de entradas y c贸gido de operaci贸n
    input wire [2:0]        pulsador,  // Son los switches que eligen si se ingresan datos o una operacion
    input wire [NBITS-1:0]  entrada,   // Bus de entrada que muestra los operandos o el codigo de operacion
    
    // Salidas:
    output [NBITS-1:0] ALU_Out   // Salida del resultado
);
    
    // Variables internas:
    reg [NBITS -1:0] inA;    // Registro de entrada que almacena el operando A
    reg [NBITS -1:0] inB;    // Registro de entrada que almacena el operando B
    reg [COD_OP-1:0] cod_op; // Registro que almacena el codigo de la operacion
    
    
    // Cosas que faltan:
        // Bloque que guarda los operandos y la operaci贸n en los registros auxiliares.
        // Lo hace sincronicamente
    always  @(posedge clk)
    begin : seleccion
        case(pulsador)
            `OPA : inA   = entrada;
            `OPB : inB   = entrada;
            `COD : cod_op = entrada[5:0];  //El codigo de operacion solo ocupa los 6 bits menos significativos del bus de entrada
            default : cod_op = 6'b000000;
        endcase
        
        if(btn_Reset) // Reseteo de entradas y c贸digo de operaci贸n:
        begin
            inA    = {NBITS {1'b0}};
            inB    = {NBITS {1'b0}};
            cod_op = {COD_OP{1'b0}};
        end
    end
    
    
    // Instancio al m贸dulo de la ALU:
    ALU 
    #(
      .NBITS(NBITS),
      .COD_OP(COD_OP)
    )
    ALU( 
        .operando_A(inA),
        .operando_B(inB),
        .cod_operacion(cod_op),
        .ALU_Result(ALU_Out) 
    );
    
endmodule // Top_module
