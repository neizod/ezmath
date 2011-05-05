math: math.l math.y
      bison -d math.y
      flex math.l
      cc -o ezmath math.tab.c lex.yy.c -lfl