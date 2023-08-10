// Top-level design thta produces 2 different divided clocks
module top_design (

	// Inputs
	input clk,
	input rst_btn,

	// Outputs
	output [4:0] led
);

	//  Internal signals
	wire rst;

	// Invert active-low button
	assign rst = ~rst_btn;

	// Turn all the leds off
	assign led[4:2] = 1'b000;

	// instantiate a module
	pulse_led pulse_0 (
		.clk(clk),
		.rst(rst),
		.out(led[0])
	);
	// instantiate a module
	pulse_led pulse_1 (
		.clk(clk),
		.rst(rst),
		.out(led[1])
	);
//	// iVnstantiate a module
//	clock_divider div_1 (
//		.clk(clk),
//		.rst(rst),
//		.out(led[0])
//	);
//	defparam div_1.COUNT_WIDTH	= 32;
//	defparam div_1.MAX_COUNT	= 1500000 - 1;
//
//	// Instantiate the second clock divider module
//	clock_divider div_2 (
//		.clk(clk),
//		.rst(rst),
//		.out(led[1])
//	);
endmodule
