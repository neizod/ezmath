CC =	cc

REQ =	$(LEX).l $(PARSE).y
LEX =	lexical
PARSE =	parser

BISON =	bison -d $(PARSE).y
FLEX =	flex $(LEX).l

define MKSRC
	$(BISON)
	$(FLEX)
endef
CCRAW =	$(PARSE).tab.c lex.yy.c
ALRAW =	$(PARSE).tab.h $(CCRAW)
RMSRC =	rm -rf $(ALRAW)

main:	ezmath
	$(RMSRC)
	cp ezmath drupal/

src:	ezmath
	mkdir src
	mv $(ALRAW) src/

ezmath:	$(REQ)
	$(MKSRC)
	$(CC) -o $@ $(CCRAW) -lfl

.PHONY:	clean
clean:
	$(RMSRC)
	rm -rf src
