ezmath:	math.l math.y
	bison -d math.y
	flex math.l
	cc -o $@ math.tab.c lex.yy.c -lfl
	cp ezmath ..
