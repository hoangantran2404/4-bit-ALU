module alu_4bit_tb;

reg [3:0] X, Y;
reg [2:0] ALU_Sel;
wire [3:0] ALU_Out;
wire Cout, Zero;

alu_4bit uut (
    .X(X),
    .Y(Y),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .Cout(Cout),
    .Zero(Zero)
);

initial begin
    // Test addition
    X = 4'b0011; Y = 4'b0001; ALU_Sel = 3'b000; #10;
    // Test subtraction
    ALU_Sel = 3'b001; #10;
    // Test AND
    ALU_Sel = 3'b010; #10;
    // Test OR
    ALU_Sel = 3'b011; #10;
    // Test XOR
    ALU_Sel = 3'b100; #10;
    // Test NAND
    ALU_Sel = 3'b101; #10;
    // Test NOR
    ALU_Sel = 3'b110; #10;
    // Test XNOR
    ALU_Sel = 3'b111; #10;
    $finish;
end

endmodule
