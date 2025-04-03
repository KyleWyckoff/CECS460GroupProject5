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


module controller(
//All operands: 8-bit signed integers
input [7:0] x1, x2, v, t, c,
input clk, equationFlag,

//Outputs: 16-bit signed integers
output reg [15:0] A, B
    );
//Only one multiplier and one adder must be used
parameter k1 = 3;
parameter k2 = 5;
reg [15:0] adder, multiplier;

always @(posedge clk)begin
    multiplier = (equationFlag == 1) ? (x1 * k1) : (v *t);
    adder = multiplier;
    multiplier = (equationFlag == 1) ? (x2 * k2) : c;
    adder = adder + multiplier;
    if(equationFlag == 1) begin
        A <= adder;
    end else begin
        B <= adder;
    end
end
endmodule













