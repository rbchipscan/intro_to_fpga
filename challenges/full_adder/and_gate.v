// Module: button 0 illuminates 2 LEDs  button 0 and 1 illuminate all leds
module and_gate (
    // Inputs
    input [1:0] pmod,

    // Outputs
    output [4:0] led
);

    // Wire declarations
    wire not_pmod_0;

    // Continuous assignment: replicate 1 wire to 2 outputs
    assign not_pmod_0 = ~pmod[0];
    assign led[0] = {2{not_pmod_0}};
    assign led[2] = {2{not_pmod_0}};
    assign led[1] = {2{~not_pmod_0}};
    assign led[3] = {2{~not_pmod_0}};

    // Continuous assignment: NOT and AND operators
    assign led[4] = not_pmod_0 & ~pmod[1];

endmodule
