`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2025 07:23:29 PM
// Design Name: 
// Module Name: controller
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

module bist(
input clk, 
input [7:0] x1, x2, v, t, c, 
output reg failedFlag
);

reg equationFlag = 0;
reg [15:0] aTrue, bTrue;
wire [15:0] aTest, bTest;

//Run a series of test on startup to ensure the wires for adder and multiplier are functional
controller a0(.x1(x1),.x2(x2),.v(v),.t(t),.c(c),.clk(clk),.equationFlag(equationFlag),.A(aTest),.B(bTest));

always@(posedge clk)begin
    equationFlag = ~equationFlag;
    aTrue = (x1 * 3) + (x2 * 5);
    bTrue = (v * t) + c;
    failedFlag = (aTrue ^ aTest) | (bTrue ^ bTest); //failedFlag will be 1 if the test did not pass
end

endmodule
