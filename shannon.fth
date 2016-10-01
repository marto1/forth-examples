include BigIntANSForth.fth
cr

." Lower bound of the game-tree complexity of chess:"
b 64 bfaculty
b 32 bfaculty b 8 bfaculty b 2 b** b 2 bfaculty b 6 b** b* b*
b/
b. cr
