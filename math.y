%{
#include <stdio.h>
#include <string.h>
#include <stdarg.h>

#include <stdlib.h>

int argc;

char latex[2048] = "\\begin{align}\n";

int stack_i = 0;
char stack_str[32][2048];
char ts[8][2048];

void dbs(void) {
  /*
  if(stack_i > 0)
    printf("(%3d)>>> %s\n", stack_i, ts[0]);
  else
    printf("(fin)::: %s\n", ts[0]);
  */
}
void dbf(void) {
  if(argc == 0)
    printf("%s\n", ts[0]);
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

 char* dSopt[19] = {"+", "-", "\\times", "\\cdot", "*", "\\div", "\\oplus", "\\ominus", "\\otimes", "\\odot", "\\circleast", "\\oslash", "\\pm", "\\mp", "\\sim", "{^\\circ}", "\\star", "\\|", "|"};
 char* dSeqv[14] = {"=", "\\equiv", "\\cong", "\\approx", "\\propto", "\\neq", "\\lt", "\\gt", "\\ll", "\\gg", "\\leq", "\\geq", "\\prec", "\\succ"};
 char* dSlgc[8] = {"\\leftarrow", "\\rightarrow", "\\leftrightarrow", "\\Rightarrow", "\\Leftrightarrow", "\\land", "\\lor", "\\neg"};
 char* dSoth[4] = {"\\ldots", "\\infty", "\\partial", "\\nabla"};
 char* dSset[9] = {"\\forall", "\\exists", "\\in", "\\notin", "\\subseteq", "\\supseteq", "\\cup", "\\cap", "\\setminus"};
 char* dNset[12] = {"\\emptyset", "\\varnothing", "\\mathbb{N}", "\\mathbb{Z}", "\\mathbb{P}", "\\mathbb{Q}", "\\mathbb{R}", "\\mathbb{C}", "\\mathbb{H}", "\\aleph", "\\Re", "\\Im"};
 char* dNtri[12] = {"\\sin", "\\cos", "\\tan", "\\cot", "\\sec", "\\csc", "\\sin^{-1}", "\\cos^{-1}", "\\tan^{-1}", "\\cot^{-1}", "\\sec^{-1}", "\\csc^{-1}"};
 char* dNhyb[12] = {"\\sinh", "\\cosh", "\\tanh", "\\coth", "\\sech", "\\csch", "\\sinh^{-1}", "\\cosh^{-1}", "\\tanh^{-1}", "\\coth^{-1}", "\\sech^{-1}", "\\csch^{-1}"};
 char* dNexp[3] = {"\\exp", "\\log", "\\ln"};
 char* dNoth[6] = {"\\operatorname{sgn}", "\\max", "\\min", "\\gcd", "\\operatorname{lcm}", "\\det"};
 char* dNovr[6] = {"\\hat{\\imath}", "\\hat{\\jmath}", "\\vec{\\imath}", "\\vec{\\jmath}", "\\overline{\\imath}", "\\overline{\\jmath}"};
 char* dOovr[5] = {"\\dot", "\\ddot", "\\hat", "\\vec", "\\overline"};
 char* dOsum[10] = {"\\sum", "\\prod", "\\coprod", "\\bigcup", "\\bigcap", "\\lim", "\\int", "\\oint", "\\iint", "\\iiint"};
%}

%token NUMBER ENGL GREEK TEXT PUNCT ESCCH
%token SOPT SEQV SLGC SOTH SSET
%token NSET NTRI NHYB NEXP NOTH

%token DIV POW CHS NRT
%token SRT MOD FLR CIL RND
%token SWC

%token OSUM FR TO WH
%token NOVR OOVR

%token OP CP OS CS OB CB
%token OB_M OB_D OL_M CL_M OL_D CL_D
%token SPC SEP SNL ALG EOL

%%

list: /* nothing */
| sentence { pop(ts[0]); strcat(latex, ts[0]); strcat(latex, " \n"); dbs(); YYACCEPT; }
/* uncomment next line to enable muti-line input
| list sentence EOL { pop(ts[0]); strcat(latex, ts[0]); strcat(latex, "\\\\\n"); dbf(); }
*/
;


sentence: superelement
| sentence superelement { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;

superelement: element
| control
;
control:subcontrol
| subcontrol POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
;
subcontrol: contsingle
| subcontsingle
;
subcontsingle: contsingle OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); }
| subcontsingle OB sentence CB { popi(2); ts[2][strlen(ts[2])-1] = '\0'; join(4, ts[2], ",", ts[1], "}"); push(ts[0]); dbs(); }
;
contsingle: SEP { push(","); }
;

element: piece
| superpiece
| sumational
| frac
| root
| modular
;
superpiece: subsuperpiece
| subsuperpiece POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); }
;
subsuperpiece: supersingle
| subsupersingle
;
subsupersingle: supersingle OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); }
| subsupersingle OB sentence CB { popi(2); ts[2][strlen(ts[2])-1] = '\0'; join(4, ts[2], ",", ts[1], "}"); push(ts[0]); dbs(); }
;
supersingle: matrix
| bracket
| choose
| round
| over
;

reduce: piece
| OP sentence CP
;

matrix: OB_M mtx_sentence CB { popi(1); join(3, "\\begin{bmatrix}\n", ts[1], "\n\\end{bmatrix}"), push(ts[0]); dbs(); }
|  OB_D mtx_sentence CB { popi(1); join(3, "\\begin{vmatrix}\n", ts[1], "\n\\end{vmatrix}"), push(ts[0]); dbs(); }
| OL_M mtx_sentence CL_M { popi(1); join(3, "\\begin{vmatrix}\n", ts[1], "\n\\end{vmatrix}"), push(ts[0]); dbs(); }
| OL_D mtx_sentence CL_D { popi(1); join(3, "\\begin{Vmatrix}\n", ts[1], "\n\\end{Vmatrix}"), push(ts[0]); dbs(); }
| SWC OP mtx_sentence CP { popi(1); join(3, "\\begin{cases}\n", ts[1], "\n\\end{cases}"), push(ts[0]); dbs(); }
;
mtx_sentence: mtx_element
| mtx_sentence mtx_element { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); }
;
mtx_element: element
| SEP { push("&"); }
;

sumational: sum_symbol /* cause shift/reduce conflict*/
| sum_symbol sum_element { popi(2); if($1<7) join(2, ts[2], ts[1]); else join(3, ts[2], "\\limits", ts[1]); push(ts[0]); dbs(); }
;
sum_symbol: OSUM { push(dOsum[$1]); }
;
sum_element: boundary
| sentence
| sentence boundary { popi(2); join(2, ts[1], ts[2]); push(ts[0]), dbs(); }
;
boundary: FR reduce TO reduce { popi(2), join(5, "_{", ts[2], "}^{", ts[1], "}"); push(ts[0]); dbs(); }
| WH reduce { popi(1), join(3, "_{\\substack{", ts[1], "}}"); push(ts[0]); dbs(); }
;

choose: reduce CHS reduce { popi(2); join(5, "{", ts[2], "\\choose", ts[1], "}"); push(ts[0]); dbs(); }
;
frac: reduce DIV reduce { popi(2); join(5, "\\frac{", ts[2], "}{", ts[1], "}"); push(ts[0]); dbs(); }
;
root: SRT reduce { popi(1); join(3, "\\sqrt{", ts[1], "}"); push(ts[0]); dbs(); }
| reduce NRT reduce { popi(2); join(5, "\\sqrt[", ts[2], "]{", ts[1], "}"); push(ts[0]); dbs(); }
;
modular: MOD reduce { popi(1); join(3, "\\pmod{", ts[1], "}"); push(ts[0]); dbs(); }
;
round: FLR reduce { popi(1); join(3, "\\lfloor", ts[1], "\\rfloor"); push(ts[0]); dbs(); }
| CIL reduce { popi(1); join(3, "\\lceil", ts[1], "\\rceil"); push(ts[0]); dbs(); }
| RND reduce { popi(1); join(3, "\\lfloor", ts[1], "\\rceil"); push(ts[0]); dbs(); }
;
over: OOVR reduce { popi(1); join(4, dOovr[$1], "{", ts[1], "}"); push(ts[0]); dbs(); }
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
| subsingle
;
subsingle: single OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); }
| subsingle OB sentence CB { popi(2); ts[2][strlen(ts[2])-1] = '\0'; join(4, ts[2], ",", ts[1], "}"); push(ts[0]); dbs(); }
;

single: number
| variable
| name
| symbol
| text
| alignment
;
number: NUMBER { push((char*)$1); }
;
variable: ENGL { join(2, " ", (char*)$1); push(ts[0]); }
| GREEK { join(2, "\\", (char*)$1); push(ts[0]); }
| NSET { push(dNset[$1]); }
| NOVR { push(dNovr[$1]); }
;
name: NTRI { push(dNtri[$1]); }
| NHYB { push(dNhyb[$1]); }
| NEXP { push(dNexp[$1]); }
| NOTH { push(dNoth[$1]); }
;
symbol: SOPT { push(dSopt[$1]); }
| SOTH { push(dSoth[$1]); }
| SLGC { push(dSlgc[$1]); }
| SSET { push(dSset[$1]); }
| SEQV { push(dSeqv[$1]); }
;
text: TEXT { strcpy(ts[1], (char*)$1+1); ts[1][strlen(ts[1])-1] = '\0'; join(3, "\\text{", ts[1], "}"); push(ts[0]); }
| PUNCT { push((char*)$1); }
| ESCCH { join(2, "\\", (char*)$1); push(ts[0]); }
;
alignment: SPC { push("\\;"); }
| SNL { push("\\\\\n"); } /* !!!note!!! delete \n out here in the finale release */
| ALG { push("&"); }
;
%%

main(int argc, char **argv) {
  if(argc > 1)
    yy_scan_string(argv[1]);
  /*
  else
    yy_scan_string("\"error: no input\"");
  */
  yyparse();
  strcat(latex, "\\end{align}");
  printf("%s\n", latex);
}

yyerror(char *s) {
  fprintf(stderr, "error: %s\n", s);
}
