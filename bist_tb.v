`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 10:48:26 AM
// Design Name: 
// Module Name: bist_tb
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


module bist_tb();
reg clk_tb;
reg [7:0] x1_tb, x2_tb, v_tb, c_tb, t_tb;
wire failedFlag_tb;
integer i;
bist uut(
.clk(clk_tb), 
.x1(x1_tb), .x2(x2_tb), .v(v_tb), 
         .t(t_tb), .c(c_tb), 
.failedFlag(failedFlag_tb
));         
initial begin
        clk_tb = 0;
        forever begin
            clk_tb = ~clk_tb;  #10;
        end
end   
initial begin
    for(i = 5; i < 50; i = i + 1) begin
        x1_tb = i-2;
        x2_tb = i+3;
        v_tb  = i*2;
        c_tb  = i+5;
        t_tb  = i;
        #10;
     end

end
endmodule

