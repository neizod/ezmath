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
 char* dName[24] = {"\\sin", "\\cos", "\\tan", "\\cot", "\\sec", "\\csc", "\\sin^{-1}", "\\cos^{-1}", "\\tan^{-1}", "\\cot^{-1}", "\\sec^{-1}", "\\csc^{-1}", "\\sinh", "\\cosh", "\\tanh", "\\coth", "\\sech", "\\csch", "\\sinh^{-1}", "\\cosh^{-1}", "\\tanh^{-1}", "\\coth^{-1}", "\\sech^{-1}", "\\csch^{-1}"};
 char* dSum[5] = {"\\sum", "\\prod", "\\int", "\\oint", "\\iint"};
%}

%token NUMBER ENGL GREEK TEXT SET
%token OPRT EQVL NAME

%token DIV POW CHS SRT NRT SWC
%token SUM FROM TO WHEN

%token OP CP OB CB OS CS
%token OB_M OL_M CL_M SEP SNL
%token NIL SPC EOL

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
| control
;
element: piece
| superpiece
| sumational
| frac
| root
;

control:subcontrol
| subcontrol POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
;
subcontrol: contsingle
| contsingle OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); }
;
contsingle: SEP { push(","); }
| SNL { push(";"); }
;

reduce: piece
| OP sentence CP
;

superpiece: subsuperpiece
| subsuperpiece POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
;
subsuperpiece: supersingle
| supersingle OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); }
;
supersingle: matrix
| bracket
| choose
;


matrix: OB_M mtx_sentence CB { popi(1); join(3, "\\begin{bmatrix}\n", ts[1], "\n\\end{bmatrix}"), push(ts[0]); dbs(); }
| OL_M mtx_sentence CL_M { popi(1); join(3, "\\begin{vmatrix}\n", ts[1], "\n\\end{vmatrix}"), push(ts[0]); dbs(); }
| SWC OP mtx_sentence CP { popi(1); join(3, "\\begin{cases}\n", ts[1], "\n\\end{cases}"), push(ts[0]); dbs(); }
;
mtx_sentence: mtx_element
| mtx_sentence mtx_element { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;
mtx_element: element /* cause shift/reduce conflict*/
| SEP { push("&"); }
| SNL { push("\\\\\n"); }
;

sumational: sum_symbol /* cause shift/reduce conflict*/
| sum_symbol sum_element { popi(2); if($1<4) join(2, ts[2], ts[1]); else join(3, ts[2], "\\limits", ts[1]); push(ts[0]); dbs(); }
;
sum_symbol: SUM { push(dSum[$1]); }
;
sum_element: boundary
| sentence
| sentence boundary { popi(2); join(2, ts[1], ts[2]); push(ts[0]), dbs(); }
;
boundary: FROM reduce TO reduce { popi(2), join(5, "_{", ts[2], "}^{", ts[1], "}"); push(ts[0]); dbs(); }
| WHEN reduce { popi(1), join(3, "_{", ts[1], "}"); push(ts[0]); dbs(); }
;

choose: reduce CHS reduce { popi(2); join(5, "{", ts[2], "\\choose", ts[1], "}"); push(ts[0]); dbs(); }
;
frac: reduce DIV reduce { popi(2); join(5, "\\frac{", ts[2], "}{", ts[1], "}"); push(ts[0]); dbs(); }
;
root: SRT reduce { popi(1); join(3, "\\sqrt{", ts[1], "}"); push(ts[0]); dbs(); }
| reduce NRT reduce { popi(2); join(5, "\\sqrt[", ts[2], "]{", ts[1], "}"); push(ts[0]); dbs(); }
;

bracket: OP sentence CP { popi(1); join(3, "\\left(", ts[1], "\\right)"); push(ts[0]); dbs(); }
| OS sentence CS { popi(1); join(3, "\\left\\{", ts[1], "\\right\\}"); push(ts[0]); dbs(); }
;

piece: subpiece
| subpiece POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
/* cause shift/reduce conflict, remove this feature due to its make parser too much complex
| variable number { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
*/
;
subpiece: single
| single OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); }
;

single: number
| text
| variable
| OPRT { push(dOprt[$1]); }
| EQVL { push(dEqvl[$1]); }
| NAME { push(dName[$1]); }
| NIL  { push("{}"); }
| SPC  { push("\\quad"); }
;
number: NUMBER { push((char*)$1); }
;
text: TEXT { strcpy(ts[1], (char*)$1+1); ts[1][strlen(ts[1])-1] = '\0'; join(3, "\\text{", ts[1], "}"); push(ts[0]); }
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
