req =	flex.l bison.y

bison =	bison -d bison.y
flex =	flex flex.l

define mksrc
	$(bison)
	$(flex)
endef
rmsrc =	rm -rf bison.tab.c bison.tab.h lex.yy.c


ezmath:	$(req)
	$(mksrc)
	cc -o $@ bison.tab.c lex.yy.c -lfl
	$(rmsrc)
	cp ezmath drupal/

src:	$(req)
	$(mksrc)
	mkdir src
	mv bison.tab.c bison.tab.h lex.yy.c src/

clean:
	$(rmsrc)
