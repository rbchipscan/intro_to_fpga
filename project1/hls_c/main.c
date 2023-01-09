int clk = 0;
int leds = 0;
int timer = 0;

int main(int argc, char * argv[])
{
	while (1)
	{
		if ( timer == 1000000 )
		{
			// place a 1 in the 0th bit of leds
			if ( leds == 0 || leds == 0b100000 )
			{
				leds = 1;
			}

			// incrementally shift the first bit forward
			leds = leds << 1;

			// reset clk
			timer = 0;
		}
	}
	return 0;
}
