%{
#include <stdio.h>
#include <string.h>
#include <stdarg.h>


char latex[1024];

int stack_i = 0;
char stack_str[64][1024];
char ts[16][1024];

void dbs(void) {
  if(stack_i > 0)
    printf("(%3d)>>> %s\n", stack_i, ts[0]);
  else
    printf("(fin)::: %s\n", ts[0]);
}
void push(char* str) {
  strcpy(stack_str[stack_i++], str);
}
void pop(char* str) {
  strcpy(str, stack_str[--stack_i]);
}
void popi(int n) {
  register int i;
  strcpy(ts[0], "");
  for(i = 1; i <= n; i++)
    pop(ts[i]);
}
void join(int n, char* strs, ...) {
  register int i;
  va_list ap;

  va_start(ap, strs);
  strcpy(ts[0], strs);
  for(i = 1; i < n; i++)
    strcat(ts[0], va_arg(ap, char*));
  va_end(ap);
}

 char* dOprt[8] = {"+", "-", "\\times", "\\cdot", "\\neg", "\\neg", "\\pm", "\\mp"};
 char* dEqvl[16] = {"=", "\\neq", "<", ">", "\\ll", "\\gg", "\\leg", "\\geg", "\\approx", "\\cong", "\\equiv", "\\rightarrow", "\\leftrightarrow", "\\land", "lor"};
 char* dSet[11] = {"\\emptyset", "\\mathbb{N}", "\\mathbb{Z}", "\\mathbb{Q}", "\\mathbb{R}", "\\mathbb{C}", "\\infty", "\\lodts", "\\forall", "\\exists", "\\exists!"};
%}

%token NUMBER ENGL GREEK SET
%token OPRT EQVL

%token DIV POW
%token SUM INT PROD FROM TO

%token OP CP OB OB_M CB
%token EOL

%%

list: /* nothing */
| list sentence EOL { pop(ts[0]); strcat(latex, ts[0]); strcat(latex, " \n"); dbs(); }
;


/*
matrix: OB_M brac_element CB { popi(1); join(3, "\\matrix{", ts[1], "}"), push(ts[0]); dbs(); }
;
*/




sentence: element
| sentence element { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;

element: piece
| sumational
| frac
| bracket
;

reduce: piece
| OP sentence CP
;

sumational: sumsymbol 
| sumsymbol sumelement { popi(2), join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;

sumsymbol: INT { push("\\int"); }
| SUM { push("\\sum"); }
| PROD { push("\\prod"); }
;

sumelement: boundary
| sentence
| sentence boundary { popi(2); join(2, ts[1], ts[2]); push(ts[0]), dbs(); }
;

boundary: FROM reduce TO reduce { popi(2), join(5, "_{", ts[2], "}^{", ts[1], "}"); push(ts[0]); dbs(); }
;

frac: reduce DIV reduce { popi(2); join(5, "\\frac{", ts[2], "}{", ts[1], "}"); push(ts[0]); dbs(); }
;

bracket: OP sentence CP { popi(1); join(3, "(", ts[1], ")"); push(ts[0]); dbs(); }
;

piece: subsingle
| subsingle POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
/* !!! conflict shift/reduce
| variable number { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
*/
;

subsingle: single
| single OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); }
;

single: number
| variable
| OPRT { push(dOprt[$1]); }
| EQVL { push(dEqvl[$1]); }
;
number: NUMBER { push((char*)$1); }
;
variable: ENGL { join(2, " ", (char*)$1); push(ts[0]); }
| GREEK { join(2, "\\", (char*)$1); push(ts[0]); }
| SET { push(dSet[$1]); }
;


%%

main(int argc, char **argv)
{
  yyparse();
  printf("%s\n", latex);
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
