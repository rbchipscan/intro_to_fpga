// Count up
module button_counter(
	// Inputs
	input clk,	// this is the 12 MHz clock

	// outputs (reg retain value until reassignment)
	output reg [7:0] led
);

	reg [23:0] timer;
	reg [2:0] timer2;

	always @ (posedge clk)
	begin
		timer <= timer + 1'b1;
		if ( timer == 24'd10000000 )
		begin
			led[timer2] <= led[timer2] ^ 1'b1;// shift_value;
			led[timer2-1] <= 1;// shift_value;
			timer2 <= timer2 + 1;
			timer <= 0;

			if ( timer2 == 4'd8 )
			begin
				timer2 <= 0;
			end
		end
	end

endmodule
