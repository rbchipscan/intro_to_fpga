// Pulse LED
module pulse_led (
	
	// Inputs
	input clk,
	input rst,

	// Outputs
	output reg out
);

	// Standard definitions
	parameter RESOLUTION = 3*8;
	parameter CLOCK_WIDTH = 10;
	parameter [CLOCK_WIDTH:0] MAX_COUNT = 800;	
	parameter [CLOCK_WIDTH:0] MAX_BRIGHTNESS = 400;
	
	// blink LED to achieve brightness
	reg [13:0]duty_cyc_timer;
	reg div_clk;
	reg dimmer;
	reg [4:0] duty;
	reg [CLOCK_WIDTH:0] brightness; 
	reg [CLOCK_WIDTH:0] count;

	assign dimmer = 1'b1;

	// 
	always @ ( posedge clk or posedge rst ) begin
		if ( rst == 1'b1 ) begin
			count <= 0;
			out <= 0;
			duty <= 0;
			dimmer <= 1;
			duty_cyc_timer <= 0;
		end else begin
			if ( duty_cyc_timer == 14'd15000 )
			begin
				duty_cyc_timer <= 0;
				if ( brightness == MAX_BRIGHTNESS )
				begin
					dimmer <= ~dimmer;
					brightness <= 0;
				end else
				begin
					brightness <= brightness + 1;
//					if ( dimmer == 1'b1 )
//					begin
//						brightness <= brightness + 1;
//					end else
//					begin
//						brightness <= brightness - 1;
//					end
				end
//				if ( brightness > MAX_BRIGHTNESS )
//				begin
//					dimmer <= ~dimmer;
//				end else
//				begin
//					if ( dimmer == 1'b0 )
//					begin
//						brightness <= brightness - 1;
//					end else
//					begin
//						brightness <= brightness + 1;
//					end
//				end
			end else
			begin
				duty_cyc_timer <= duty_cyc_timer + 1;
				if ( count == MAX_COUNT )
				begin
					count <= 0;
				end else
				begin
					if ( dimmer == 1'b1 )
					begin
						// Blink at 50% duty cycle
						if ( count < brightness )
						begin
							out <= 1'b1;
						end else
						begin
							out <= 1'b0;
						end
					end else
					begin
						// Blink at 50% duty cycle
						if ( count > brightness )
						begin
							out <= 1'b1;
						end else
						begin
							out <= 1'b0;
						end
					end
					count <= count + 1;
				end
			end
//			if ( count == MAX_COUNT ) begin
//				count <= 0;
//				if ( dimmer == 1'b1 ) begin
//					duty <= duty + 1;
//				end else begin
//					duty <= duty - 1;
//				end
//				if (duty[4] == 1'b1) begin
//					dimmer <= ~dimmer;
//				end
//			end else begin
//				count <= count + 1;
//				brightness <= brightness + 1;
//			end
//			if ( brightness < duty ) begin
//				out <= 1'b1;
//			end else begin
//				out <= 1'b0;
//			end
		end
	end
endmodule
