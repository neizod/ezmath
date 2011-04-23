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

 char* dOprt[13] = {"+", "-", "\\times", "\\cdot", "\\sim", "!", "\\pm", "\\mp", "\\oplus", "\\ominus", "\\otimes", "\\odot", "\\oslash"};
 char* dEqvl[16] = {"=", "\\neq", "<", ">", "\\ll", "\\gg", "\\leg", "\\geg", "\\approx", "\\cong", "\\equiv", "\\rightarrow", "\\leftrightarrow", "\\land", "\\lor", "\\neg"};
 char* dSet[17] = {"\\emptyset", "\\mathbb{N}", "\\mathbb{Z}", "\\mathbb{Q}", "\\mathbb{R}", "\\mathbb{C}", "\\aleph", "\\infty", "\\lodts", "\\forall", "\\exists", "\\in", "\\notin", "\\subseteq", "\\supseteq", "\\cup", "\\cap"};
 char* dName[12] = {"\\sin", "\\cos", "\\tan", "\\cot", "\\sec", "\\csc", "\\arcsin", "\\arccos", "\\arctan", "\\arccot", "\\arcsec", "\\arccsc"};
 char* dSum[3] = {"\\sum", "\\prod", "\\int"};
%}

%token NUMBER ENGL GREEK SET
%token OPRT EQVL NAME

%token DIV POW SQRT ROOT
%token SUM FROM TO

%token OP CP OB OB_M CB SEP SNL
%token SPACE EOL

%%

list: /* nothing */
| list sentence EOL { pop(ts[0]); strcat(latex, ts[0]); strcat(latex, " \n"); dbs(); }
;

sentence: superelement
| sentence superelement { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;

/*
sentence: element
| sentence element { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;
*/

superelement: element
| SEP { push(","); }
| SNL { push(";"); }
;

element: piece
| sumational
| frac
| root
| bracket
| matrix
| SPACE { push("\\quad"); }
;

reduce: piece
| OP sentence CP
;


matrix: OB_M mtx_sentence CB { popi(1); join(3, "\\begin{bmatrix}\n", ts[1], "\n\\end{bmatrix}"), push(ts[0]); dbs(); }
;

mtx_sentence: mtx_element
| mtx_sentence mtx_element { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;

mtx_element: element /* cause shift/reduce conflict*/
| SEP { popi(1); join(2, ts[1], "&"); push(ts[0]); dbs(); }
| SNL { popi(1); join(2, ts[1], "\\\\\n"); push(ts[0]); dbs(); }
;


sumational: sum_symbol /* cause shift/reduce conflict*/
| sum_symbol sum_element { popi(2), join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;

sum_symbol: SUM { push(dSum[$1]); }
;

sum_element: boundary
| sentence
| sentence boundary { popi(2); join(2, ts[1], ts[2]); push(ts[0]), dbs(); }
;

boundary: FROM reduce TO reduce { popi(2), join(5, "_{", ts[2], "}^{", ts[1], "}"); push(ts[0]); dbs(); }
;


frac: reduce DIV reduce { popi(2); join(5, "\\frac{", ts[2], "}{", ts[1], "}"); push(ts[0]); dbs(); }
;

root: SQRT reduce { popi(1); join(3, "\\sqrt{", ts[1], "}"); push(ts[0]); dbs(); }
| reduce ROOT reduce { popi(2); join(5, "\\sqrt[", ts[2], "]{", ts[1], "}"); push(ts[0]); dbs(); }
;

bracket: OP sentence CP { popi(1); join(3, "\\left(", ts[1], "\\right)"); push(ts[0]); dbs(); }
;

piece: subsingle
| subsingle POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
/* cause shift/reduce conflict
   remove this feature due to its make parser too much complex
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
| NAME { push(dName[$1]); }
;
number: NUMBER { push((char*)$1); }
;
variable: ENGL { join(2, " ", (char*)$1); push(ts[0]); }
| GREEK { join(2, "\\", (char*)$1); push(ts[0]); }
| SET { push(dSet[$1]); }
;


%%

main(int argc, char **argv) {
  yyparse();
  printf("%s\n", latex);
}

yyerror(char *s) {
  fprintf(stderr, "error: %s\n", s);
}
