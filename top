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


module top(
input clk,
input reset,
output bistSignal

);
reg bistPassed = 0;   
reg equationFlag = 0;
localparam period = 5;

 
/*At reset, run a short BIST routine to validate the multiplier and adder with known input-output pairs.  
Indicate test pass/fail via an output signal.
Normal operation begins only if the BIST passes.  */
always @(posedge reset) begin
    


end   
 
always @(posedge clk)begin
    equationFlag = ~equationFlag;

end
    
endmodule
