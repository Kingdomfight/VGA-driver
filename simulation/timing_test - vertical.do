#vga timing module sync and counter test

force RST 0
force CLK 0 0, 1 20 -r 40 ns
run 30000000 ns
force RST 1
run 100 ns
force RST 0
run 30000000 ns