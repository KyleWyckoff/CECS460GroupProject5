`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 10:53:25 PM
// Design Name: 
// Module Name: top
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
    
    reg [7:0] x1, x2, v, t, c;
    reg passed;
    wire failed;
    integer i;
    
    bist b1 (
        .clk(clk), 
        .x1(x1), 
        .x2(x2),
        .v(v), 
        .t(t), 
        .c(c), 
        .failedFlag(failed)
        );
     
    assign bistSignal = passed ? 1 : 0; // 1 if passed, 0 if failed
    
    /*At reset, run a short BIST routine to validate the multiplier and adder with known input-output pairs.  
    Indicate test pass/fail via an output signal.
    Normal operation begins only if the BIST passes.  */
    always @(posedge reset) begin
        for (i=1; i < 5; i++) begin
            x1 <= i;
            x2 <= i + 1;
            v <= i;
            t <= 2;
            c <= i * 2;
        end    
    end   
    
    always @ (failed) begin
        if (failed) begin
            passed <= 0;
        end else begin
            passed <= 1; // Passed
        end
    end
    
    always @(posedge clk) begin
        equationFlag <= ~equationFlag;
    end
    
endmodule
