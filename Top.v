//`timescale 1ns / 1ps

module Top 
#(  // Parámetros:
    parameter NBITS  = 8, // bits de entrada (switches)
    parameter COD_OP = 6
)
(   // Entradas:
    input wire              clk,      // Clock
    input wire [2,0]        pulsador, // Son los switches que eligen si se ingresan datos o una operacion
    input wire [NBITS-1:0]  entrada,  //Bus de entrada que muestra los operandos o el codigo de operacion
    
    // Salidas:
    output wire [NBITS-1:0] ALU_Out //salida de resultado
);
    
    // Variables internas:
    reg [NBITS -1:0] inA;    // Registro de entrada que almacena el operando A
    reg [NBITS -1:0] inB;    // Registro de entrada que almacena el operando B
    reg [COD_OP-1:0] cod_op; // Registro que almacena el codigo de la operacion
    
    
    // Cosas que faltan:
    
    
    
    
    
    // Instancio al módulo de la ALU:
    alu alu_0 ( 
        .operando_A(inA),
        .operando_B(inB),
        .cod_operacion(cod_op),
        .ALU_Result(ALU_Out) 
    );
    
endmodule
