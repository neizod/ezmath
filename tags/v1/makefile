ezmath:	flex.l bison.y
	bison -d bison.y
	flex flex.l
	cc -o $@ bison.tab.c lex.yy.c -lfl
	cp ezmath drupal/

clean:
	rm -rf bison.tab.c bison.tab.h lex.yy.c
