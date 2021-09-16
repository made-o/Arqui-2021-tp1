`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2021 23:31:22
// Design Name: 
// Module Name: ALU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_tb();


    //Local parameters
    localparam              nbits = 8;
    // Entradas:
    reg signed [nbits-1:0]  operando_A;    // registro A
    reg signed [nbits-1:0]  operando_B;    // registro B
    reg signed [6-1:0] cod_operacion; // la operacion a realizar
     
    // Salidas:
    wire signed [nbits-1:0]  ALU_Result; // ALU Output  


    initial begin
      $dumpfile("dump.vcd"); $dumpvars;
        
        #20
      	cod_operacion	=	6'b000000;
      	
        #20//suma
      	operando_A	=	8'b00000100;
        #20
      	operando_B	=	8'b00001100;
      	#20
      	cod_operacion	=	6'b100000   ;
      	
      	#20
      	cod_operacion	=	6'b000000;
        
      	#20//resta
      	operando_A	=	8'b00000100;
        #20
      	operando_B	=	8'b00001100;
      	#20
      	cod_operacion	=	6'b100010	;
      	
      	#20
      	cod_operacion	=	6'b000000;
        
      	#20//and
      	operando_A	=	8'b00000100;
        #20
      	operando_B	=	8'b00001100;
      	#20
      	cod_operacion	=	6'b100100;
      	
      	#20
      	cod_operacion	=	6'b000000;
        
      	#20//or
      	operando_A	=	8'b00000100;
        #20
      	operando_B	=	8'b00001100;
      	#20
      	cod_operacion	=	6'b100101;
      	
      	#20
      	cod_operacion	=	6'b000000;
      	
      	#20//xor
      	operando_A	=	8'b00000100;
        #20
      	operando_B	=	8'b00001100;
      	#20
      	cod_operacion	=	6'b100110;
      	
      	#20
      	cod_operacion	=	6'b000000;
      	
      	#20//SRA
      	operando_A	=	8'b00001100;
        #20
      	operando_B	=	8'b00000010;
      	#20
      	cod_operacion	=	6'b000011;
      	
      	#20
      	cod_operacion	=	6'b000000;
      	
      	#20//SRL
      	operando_A	=	8'b00001100;
        #20
      	operando_B	=	8'b00000011;
      	#20
      	cod_operacion	=	6'b000010;
      	
      	#20
      	cod_operacion	=	6'b000000;
      	
      	#20//NOR
      	operando_A	=	8'b00000100;
        #20
      	operando_B	=	8'b00001100;
      	#20
      	cod_operacion	=	6'b100111;
      	
      	#20
      	cod_operacion	=	6'b000000;
        
        #100
        $finish;
    end

    ALU
    #(
      .NBITS							(nbits),
      .COD_OP                           (6)
     )
    ALU
    (
      	.operando_A						(operando_A),
      	.operando_B                     (operando_B),
      	.cod_operacion                  (cod_operacion),
      	.ALU_Result					    (ALU_Result)
    );
  initial $monitor($time,operando_A,operando_B,cod_operacion,ALU_Result);

endmodule
