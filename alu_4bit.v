// This code is desgined in Verilog-2001, which includes some fundadmental logic operations 
//(AND, OR, XOR, NAND, NOR, XNOR), addition, subtraction, and outputs Zero and Carry flags.
module alu_4bit(
    input [3:0] X,
    input [3:0] Y,
    input [2:0] ALU_Sel,
    output reg [3:0] ALU_Out,
    output reg Cout,
    output reg Zero
);

// ============Function Definitions===============
function [4:0] add;
  input [3:0] a;// if you run System Verilog, you can replace by input [3:0] a,b;
  input [3:0] b;
    begin 
        add = a + b;
    end
endfunction

function [4:0] sub;
    input [3:0] a;
    input [3:0] b;
    begin
        sub = a - b;
    end
endfunction

  function [4:0] AND_op;// AND_operation
    input [3:0] a;
    input [3:0] b;
    begin
        AND_op = a & b;
    end
endfunction

function [4:0] OR_op;
    input [3:0] a;
    input [3:0] b;
    begin
        OR_op = a | b;
    end
endfunction

function [4:0] XOR_op;
    input [3:0] a;
    input [3:0] b;
    begin
        XOR_op = a ^ b;
    end
endfunction

function [4:0] NAND_op;
    input [3:0] a;
    input [3:0] b;
    begin
        NAND_op = ~(a & b);
    end
endfunction

function [4:0] NOR_op;
    input [3:0] a;
    input [3:0] b;
    begin
        NOR_op = ~(a | b);
    end
endfunction

function [4:0] XNOR_op;
    input [3:0] a;
    input [3:0] b;
    begin
        XNOR_op = ~(a ^ b);
    end
endfunction

// =============== MAIN LOGIC ======================
always @(*) begin
    {Cout, ALU_Out} = 5'b00000;

    casez (ALU_Sel)
        3'b00?: {Cout, ALU_Out} = (ALU_Sel[0]) ? sub(X, Y)     : add(X, Y);
        3'b01?: {Cout, ALU_Out} = (ALU_Sel[0]) ? OR_op(X, Y)   : AND_op(X, Y);
        3'b10?: {Cout, ALU_Out} = (ALU_Sel[0]) ? XOR_op(X, Y)  : NAND_op(X, Y);
        3'b11?: {Cout, ALU_Out} = (ALU_Sel[0]) ? NOR_op(X, Y)  : XNOR_op(X, Y);
        default: begin
            ALU_Out = 4'b0000;
            Cout    = 1'b0;
        end
    endcase

    Zero = (ALU_Out == 4'b0000) ? 1'b1 : 1'b0;
end

endmodule
