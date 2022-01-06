LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY sync_controller is
	PORT (
			CLK			:	in		STD_LOGIC;
			RST			:	in		STD_LOGIC;
			H_SYNC		:	out	STD_LOGIC;
			V_SYNC		:	out	STD_LOGIC;
			H_BUF_SYNC	: 	out	STD_LOGIC;
			V_BUF_SYNC	:	out 	STD_LOGIC;
			BLANK			:	out	STD_LOGIC
		);
END sync_controller;

ARCHITECTURE behaviour OF sync_controller IS
	constant HD		:	integer	:=	799;	--Horizontal definition
	constant HFP	:	integer	:=	24;	--Horizontal front porch
	constant HSP	:	integer	:=	72;	--Horizontal sync pulse
	constant HBP	:	integer	:=	96;	--ho rizontal back porch
	
	constant VD		:	integer	:=	479;	--Vertical definition
	constant VFP	:	integer	:=	3;	--Vertical front porch
	constant VSP	:	integer	:=	7;		--Vertical sync pulse
	constant VBP	:	integer	:=	10;	--Vertical back porch
	
	signal H_POS	: integer := 0;	--horizontal position
	signal V_POS	: integer := 0;	--vertical position	

	
BEGIN

Horizontal_position:process(CLK,RST)
BEGIN
	if(RST = '1') then
		H_POS <= 0;
	elsif(rising_edge(CLK)) then
		if(H_POS = (HD + HFP + HSP + HBP)) then
			H_POS <= 0;
		else
			H_POS <= H_POS + 1;
		end if;
	end if;
end process;

Vertical_position:process(CLK,RST)
BEGIN
	if(RST = '1') then
		V_POS <= 0;
	elsif(rising_edge(CLK)) then
		if(H_POS = (HD + HFP + HSP + HBP)) then
			if (V_POS = (VD + VFP + VSP + VBP)) then
				V_POS <= 0;
			else
				V_POS <= V_POS + 1;
			end if;
		end if;
	end if;
end process;

Horizontal_syncs:PROCESS(CLK,RST,H_POS)
BEGIN
	if(RST = '1') then
		H_SYNC <= '0';
		H_BUF_SYNC <= '1';
	elsif(rising_edge(CLK)) then
		IF((H_POS <= (HD + HFP)) OR (H_POS > (HD + HFP + HSP) AND H_POS < HD + HFP+ HSP + HBP)) THEN
			H_SYNC <= '1';
			H_BUF_SYNC <= '0';
		ELSIF(H_POS = HD + HFP + HSP + HBP) THEN
			H_SYNC <= '1';
			H_BUF_SYNC <= '1';
		ELSE
			H_SYNC <= '0';
			H_BUF_SYNC <= '0';
		end if;
	end if;
end process;

Vertical_syncs:PROCESS(CLK,RST,V_POS)
BEGIN
	if(RST = '1') then
		V_SYNC <= '0';
		V_BUF_SYNC <= '1';
	elsif(rising_edge(CLK)) then
		IF((V_POS <= (VD + VFP)) OR (V_POS > (VD + VFP + VSP) AND V_POS < VD + VFP + VSP + VBP)) THEN
			V_SYNC <= '1';
			V_BUF_SYNC <= '0';
		ELSIF(V_POS = VD + VFP + VSP + VBP) THEN
			V_SYNC <= '1';
			V_BUF_SYNC <= '1';
		ELSE
			V_SYNC <= '0';
			V_BUF_SYNC <= '0';
		end if;
	end if;
end process;

Blanking:PROCESS(CLK,RST)
BEGIN
	IF(RST = '1') THEN
		BLANK <= '1';
	ELSIF(rising_edge(CLK)) THEN
		IF((H_POS > HD + 1) OR (V_POS > VD + 1)) THEN
			BLANK <= '0';
		ELSE
			BLANK <= '1';
		END IF;
	END IF;
END PROCESS;
end behaviour;