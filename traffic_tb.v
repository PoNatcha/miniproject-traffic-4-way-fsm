`timescale 1ns / 1ps

module fourway_contorller_tb;
	reg clk;
	reg reset;
	wire [2:0] l1;
	wire [2:0] l2;
	wire [2:0] l3;
	wire [2:0] l4;
	fourway_traficlight_countroller uut (
		.clk(clk), 
		.reset(reset), 
		.l1(l1), 
		.l2(l2), 
		.l3(l3), 
		.l4(l4)
	);

	initial begin
		clk = 0;
      reset = 1; #5
		reset = 0; #1000
		reset = 1; #5
		reset = 0;

	end
  always #5 clk = ~clk;     
endmodule