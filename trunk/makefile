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

ezmath:	$(REQ)
	$(MKSRC)
	$(CC) -o $@ $(CCRAW) -lfl
	$(RMSRC)
	cp ezmath drupal/

src:	$(REQ)
	$(MKSRC)
	mkdir src
	mv $(ALRAW) src/

.PHONY:	clean
clean:
	$(RMSRC)
	rm -rf src
