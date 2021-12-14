LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY char_library IS
	PORT (
			CLK	:	IN		STD_LOGIC;
			SEL	:	IN		INTEGER RANGE 0 to 22;
			DATA	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
END char_library;

ARCHITECTURE behaviour OF char_library IS

TYPE char IS ARRAY(8 DOWNTO 0) OF STD_LOGIC_VECTOR(6 DOWNTO 0);
TYPE char_array IS ARRAY(22 DOWNTO 0) OF char;
CONSTANT lib : char_array :=  (


					       0 =>(0 => "0000000",		--char = '0'
									1 => "0011100",
									2 => "0100110",
									3 => "0101010",
									4 => "0110010",
									5 => "0100010",
									6 => "0100010",
									7 => "0011100",
									8 => "0000000"),
										
					       1 =>(0 => "0000000",		--char = '1'
									1 => "0001000",
									2 => "0011000",
									3 => "0001000",
									4 => "0001000",
									5 => "0001000",
									6 => "0001000",
									7 => "0011100",
									8 => "0000000"),

					       2 =>(0 => "0000000",		--char = '2'
									1 => "0011100",
									2 => "0100010",
									3 => "0000010",
									4 => "0000100",
									5 => "0001000",
									6 => "0010000",
									7 => "0111110",
									8 => "0000000"),
																			
					       3 =>(0 => "0000000",		--char = '3'
									1 => "0111110",
									2 => "0000100",
									3 => "0001000",
									4 => "0000100",
									5 => "0000010",
									6 => "0100010",
									7 => "0011100",
									8 => "0000000"),

					       4 =>(0 => "0000000",		--char = '4'
									1 => "0000100",
									2 => "0001100",
									3 => "0010100",
									4 => "0100100",
									5 => "0111110",
									6 => "0000100",
									7 => "0000100",
									8 => "0000000"),	
									
					       5 =>(0 => "0000000",		--char = '5'
									1 => "0111110",
									2 => "0100000",
									3 => "0111100",
									4 => "0000010",
									5 => "0000010",
									6 => "0100010",
									7 => "0011100",
									8 => "0000000"),
										
					      6 => (0 => "0000000",		--char = '6'
									1 => "0001100",
									2 => "0010000",
									3 => "0100000",
									4 => "0111100",
									5 => "0100010",
									6 => "0100010",
									7 => "0011100",
									8 => "0000000"),

					       7 =>(0 => "0000000",		--char = '7'
									1 => "0111110",
									2 => "0000010",
									3 => "0000100",
									4 => "0001000",
									5 => "0010000",
									6 => "0010000",
									7 => "0010000",
									8 => "0000000"),
									
							 8 =>(0 => "0000000",		--char = '8'
									1 => "0011100",
									2 => "0100010",
									3 => "0100010",
									4 => "0011100",
									5 => "0100010",
									6 => "0100010",
									7 => "0011100",
									8 => "0000000"),
									
							 9 =>(0 => "0000000",		--char = '9'
									1 => "0011100",
									2 => "0100010",
									3 => "0100010",
									4 => "0011110",
									5 => "0000010",
									6 => "0000100",
									7 => "0011000",
									8 => "0000000"),
									
						   10 =>(0 => "0000000",		--char = '?'
									1 => "0011100",
									2 => "0100010",
									3 => "0000010",
									4 => "0000100",
									5 => "0001000",
									6 => "0000000",
									7 => "0001000",
									8 => "0000000"),		

						   11 =>(0 => "0000000",		--char = '='
									1 => "0000000",
									2 => "0111110",
									3 => "0000000",
									4 => "0111110",
									5 => "0000000",
									6 => "0000000",
									7 => "0000000",
									8 => "0000000"),	

						   12 =>(0 => "0000000",		--char = '+'
									1 => "0001000",
									2 => "0001000",
									3 => "0111110",
									4 => "0001000",
									5 => "0001000",
									6 => "0000000",
									7 => "0000000",
									8 => "0000000"),										

						   13 =>(0 => "0000000",		--char = '-'
									1 => "0000000",
									2 => "0000000",
									3 => "0111110",
									4 => "0000000",
									5 => "0000000",
									6 => "0000000",
									7 => "0000000",
									8 => "0000000"),	

							14 =>(0 => "0000000",		--char = '/'
									1 => "0000000",
									2 => "0000010",
									3 => "0000100",
									4 => "0001000",
									5 => "0010000",
									6 => "0100000",
									7 => "0000000",
									8 => "0000000"),	

							15 =>(0 => "0000000",		--char = 'G'
									1 => "0011100",
									2 => "0100010",
									3 => "0100000",
									4 => "0101110",
									5 => "0100010",
									6 => "0100010",
									7 => "0011110",
									8 => "0000000"),										

							16 =>(0 => "0000000",		--char = 'O'
									1 => "0011100",
									2 => "0100010",
									3 => "0100010",
									4 => "0100010",
									5 => "0100010",
									6 => "0100010",
									7 => "0011100",
									8 => "0000000"),	
									
							17 =>(0 => "0000000",		--char = 'E'
									1 => "0111110",
									2 => "0100000",
									3 => "0100000",
									4 => "0111100",
									5 => "0100000",
									6 => "0100000",
									7 => "0111110",
									8 => "0000000"),	

							18 =>(0 => "0000000",		--char = 'D'
									1 => "0111000",
									2 => "0100100",
									3 => "0100010",
									4 => "0100010",
									5 => "0100010",
									6 => "0100100",
									7 => "0111000",
									8 => "0000000"),	

							19 =>(0 => "0000000",		--char = 'F'
									1 => "0111110",
									2 => "0100000",
									3 => "0100000",
									4 => "0111100",
									5 => "0100000",
									6 => "0100000",
									7 => "0100000",
									8 => "0000000"),	

							20 =>(0 => "0000000",		--char = 'U'
									1 => "0100010",
									2 => "0100010",
									3 => "0100010",
									4 => "0100010",
									5 => "0100010",
									6 => "0100010",
									7 => "0011100",
									8 => "0000000"),
									
							21 =>(0 => "0000000",		--char = 'T'
									1 => "0111110",
									2 => "0001000",
									3 => "0001000",
									4 => "0001000",
									5 => "0001000",
									6 => "0001000",
									7 => "0001000",
									8 => "0000000"),	

							22 =>(0 => "0000000",		--char = '!'
									1 => "0001000",
									2 => "0001000",
									3 => "0001000",
									4 => "0001000",
									5 => "0000000",
									6 => "0000000",
									7 => "0001000",
									8 => "0000000")
								);																
																																								
SIGNAL counter :	integer := 0;
SIGNAL temp	:	char := lib(0);

BEGIN
	CHAR_SEL:PROCESS(SEL)
	BEGIN
		temp <= lib(SEL);
	END PROCESS;

	INC:process(CLK)
	BEGIN
		IF(rising_edge(CLK)) THEN
			IF(counter >= 8) THEN
				counter <= 0;
			ELSE
				counter <= counter + 1;
			END IF;
		END IF;
	END PROCESS;
	
	OUTPUT:PROCESS(CLK)
	BEGIN
		IF(rising_edge(CLK)) THEN
			DATA <= temp(counter);
		END IF;
	END PROCESS;
END ARCHITECTURE;