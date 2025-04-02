`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2025 09:43:44 PM
// Design Name: 
// Module Name: controller_tb
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


module controller_tb();

reg equationFlag_tb, clk_tb;
reg [7:0] x1_tb, x2_tb, v_tb, t_tb, c_tb;
wire [15:0] A_tb, B_tb;
integer i;
controller uut(.x1(x1_tb), .x2(x2_tb), .v(v_tb), .t(t_tb), .c(c_tb),
               .clk(clk_tb), .equationFlag(equationFlag_tb), .A(A_tb), .B(B_tb));
               
initial begin
        clk_tb = 0;
        equationFlag_tb = 0;
        forever begin
            clk_tb = ~clk_tb;
            #5;
        end
end   
always@(posedge clk_tb)begin
    equationFlag_tb = ~equationFlag_tb;
end

initial begin
    for(i = 0; i < 20; i = i + 1) begin
        x1_tb = i+1; 
        x2_tb = i+3;
        v_tb  = i*2;
        t_tb  = i+2;
        c_tb  = i*5;  
        #10;
    end
end         
endmodule
