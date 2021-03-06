`timescale 1ns / 1ps
module Top_tb();

    //Local parameters
    localparam nbits   = 8;
    localparam nBitsOp = 6;

    //inputs
  	reg  [2:0]       pulsador;
  	reg  [nbits-1:0] entrada;
    reg              i_clock;
  	//outputs
  	wire [nbits-1:0] dato_result;


    initial begin
      $dumpfile("dump.vcd"); $dumpvars;

        i_clock = 1'b0;
        
        #10//a
      	entrada	= 8'b00000100;
        #20
      	pulsador = 3'b001;
      	#10
      	pulsador = 3'b000;
      	
      	#10//b
      	entrada	= 8'b00000101;
		#20
      	pulsador = 3'b010;
      	#10
      	pulsador =	3'b000;
      	
      	#10//suma
      	entrada	=	8'b00100000;
        #20
      	pulsador =	3'b100;
      	#10
      	pulsador = 3'b000;
      	
      	#10//resta
      	entrada	= 8'b00100010;
        #20
      	pulsador = 3'b100;
      	#10
      	pulsador = 3'b000;
      	
      	#10// and
      	entrada	 = 8'b00100100;
        #20
      	pulsador = 3'b100;
      	#10
      	pulsador = 3'b000;
      	
      	#10// or
      	entrada	 = 8'b00100101;
        #20
      	pulsador = 3'b100;
      	#10
      	pulsador = 3'b000;
      	
      	#10// xor
      	entrada	= 8'b00100110;
      	#20
      	pulsador = 3'b100;
      	#10
      	pulsador = 3'b000;
        
        #10//a
      	entrada	= 8'b00001001;
        #20
      	pulsador = 3'b001;
      	#10
      	pulsador = 3'b000;
      	
      	#10//b
      	entrada	= 8'b00000010;
		#20
      	pulsador = 3'b010;
      	#10
      	pulsador =	3'b000;
        
        #10//SRA
      	entrada	= 8'b00000011;
        #20
      	pulsador = 3'b100;
      	#10
      	pulsador = 3'b000;
      	
      	#10//SRL
      	entrada	= 8'b00000010;
		#20
      	pulsador = 3'b100;
      	#10
      	pulsador =	3'b000;
        
        #10//NOR
      	entrada	= 8'b00100111;
        #20
      	pulsador = 3'b100;
      	#10
      	pulsador = 3'b000;
      
      
        #100
        $finish;
    end

    always 
        begin
            #10
            i_clock = ~i_clock;
        end

    Top
    #(
      .NBITS (nbits),
      .COD_OP (nBitsOp)
     )
    Top
    (
        .clk (i_clock),
      	.pulsador (pulsador),
      	.entrada (entrada),
      	.ALU_Out (dato_result)
    );
  initial $monitor($time,entrada,pulsador,dato_result);

endmodule//testb_cnt_clock
