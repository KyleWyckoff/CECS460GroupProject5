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

module top_tb();

    reg clk, reset;
    wire bistSignal;
    
    top uut(.clk(clk), .reset(reset), .bistSignal(bistSignal));
    
    initial begin
      clk = 0; // Start clock at 0
      forever begin
        #5 clk = ~clk; // Toggle every 5 time units => 10-unit clock period
      end
    end
    
    initial begin
    
        #100;
        
        reset = 1;
        
        #100;
        
        reset = 0;
        
    end

endmodule
