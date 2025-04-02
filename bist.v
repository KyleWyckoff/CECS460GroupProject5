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

reg [15:0] aTest, bTest, aTrue, bTrue;
parameter k1 = 3, k2 = 5;

//Run a series of test on startup to ensure the wires for adder and multiplier are functional
controller a0(.x1(x1),.x2(x2),.v(v),.t(t),.c(c),.clk(clk),.equationFlag(0),.A(aTest),.B(bTest));
controller a1(.x1(x1),.x2(x2),.v(v),.t(t),.c(c),.clk(clk),.equationFlag(1),.A(aTest),.B(bTest));

initial begin

    aTrue = (x1 * k1) + (x2 * k2);
    bTrue = (v * t) + c;
    failedFlag = (aTrue ^ aTest) | (bTrue ^ bTest); //failedFlag will be 1 if the test did not pass
    
end
endmodule
