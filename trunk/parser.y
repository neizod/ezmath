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
  if(stack_i > 0) {
    printf("(%3d)>>> %s\n", stack_i, ts[0]);
  } else {
    printf("(fin)::: %s\n", ts[0]);
    exit(0);
  }
  /* uncomment above to enable step-debug mode */
}
void push(char* str) {
  strcpy(stack_str[stack_i++], str);
  dbs();
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
%}

%token NUMBER REPEAT
%token ENGL GREEK LATEX TEXT PUNCT
%token NSET NAME PSEUDO FUNC INVFUNC
%token SOPT SEQV SLGC SOTH SSET

%token DIV POW CHS NRT
%token SRT MOD
%token ABS NRM BRA KET INN FLR CIL RND

%token OSUM FR TO WH
%token NOVR OOVR

%token OP CP OS CS OB CB
%token OP_M OB_M OB_D OB_V OB_P OB_C
%token SPC TAB SEP SNL ALG EOL

%%

list: sentence { pop(ts[0]); strcat(latex, ts[0]); strcat(latex, " \n"); dbs(); YYACCEPT; }
;

sentence: /* nothing */ { push(""); }
| subsentence
;
subsentence: superelement
| subsentence superelement { popi(2); join(2, ts[2], ts[1]); push(ts[0]); }
;

superelement: element
| control
;
control: subcontrol
| subcontrol POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); }
;
subcontrol: contsingle
| subcontsingle
;
subcontsingle: contsingle OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); }
| subcontsingle OB sentence CB { popi(2); ts[2][strlen(ts[2])-1] = '\0'; join(4, ts[2], ",", ts[1], "}"); push(ts[0]); }
;
contsingle: SEP { push(","); }
| SNL { push(";"); }
| EOL { push("\\\\\n"); }
;

element: piece
| superpiece
| superreduce
| frac
;
superpiece: subsuperpiece
| subsuperpiece POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); }
;
subsuperpiece: supersingle
| subsupersingle
;
subsupersingle: supersingle OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); }
| subsupersingle OB sentence CB { popi(2); ts[2][strlen(ts[2])-1] = '\0'; join(4, ts[2], ",", ts[1], "}"); push(ts[0]); }
;
supersingle: summation
| bracket
;

reduce: piece
| OP sentence CP
| superreduce
;
superreduce: subreduce
| subreduce POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); }
| OP sentence CP POW reduce { popi(2); join(5, "\\left(", ts[2], "\\right)^{", ts[1], "}"); push(ts[0]); }
;
subreduce: OP sentence CP OB sentence CB { popi(2); join(5, "\\left(", ts[2], "\\right)_{", ts[1], "}"); push(ts[0]); }
| subreduce OB sentence CB { popi(2); ts[2][strlen(ts[2])-1] = '\0'; join(4, ts[2], ",", ts[1], "}"); push(ts[0]); }
;

matrix: mtx_wrap mtx_sentence CB { popi(2); join(7, "\\begin{", ts[2], "}\n", ts[1], "\n\\end{", ts[2], "}"), push(ts[0]); }
;
mtx_wrap: OB_M { push("bmatrix"); }
| OB_D { push("vmatrix"); }
| OB_V { push("Vmatrix"); }
| OB_P { push("pmatrix"); }
| OB_C { push("cases"); }
;
mtx_sentence: /* nothing */ { push("{}"); }
| mtx_subsentence
;
mtx_subsentence: mtx_element
| mtx_subsentence mtx_element { popi(2); join(2, ts[2], ts[1]); push(ts[0]); }
;
mtx_element: element
| SEP { push("&"); }
| SNL { push("\\\\\n"); }
| EOL { push(""); /* do nothing -- but require to push empty string since it is a token too */ }
;

summation: sum_symbol sum_element { popi(2); join(2, ts[2], ts[1]); push(ts[0]);}
;
sum_symbol: OSUM { push((char*)$1); }
;
sum_element: sentence
| sentence boundary { popi(2); join(3, "\\limits", ts[1], ts[2]); push(ts[0]); }
;
boundary: FR reduce TO reduce { popi(2), join(5, "_{", ts[2], "}^{", ts[1], "}"); push(ts[0]); }
| WH reduce { popi(1), join(3, "_{", ts[1], "}"); push(ts[0]); }
;

frac: reduce DIV reduce { popi(2); join(5, "\\frac{", ts[2], "}{", ts[1], "}"); push(ts[0]); }
;
root: SRT reduce { popi(1); join(3, "\\sqrt{", ts[1], "}"); push(ts[0]); }
| reduce NRT reduce { popi(2); join(5, "\\sqrt[", ts[2], "]{", ts[1], "}"); push(ts[0]); }
;

bracket: OP sentence CP { popi(1); join(3, "\\left(", ts[1], "\\right)"); push(ts[0]); }
;
subbracket: OP sentence CHS sentence CP { popi(2); join(5, "{", ts[2], "\\choose", ts[1], "}"); push(ts[0]); }
| OP_M sentence CP { popi(1); join(3, "\\pmod{", ts[1], "}"); push(ts[0]); }
| OS sentence CS { popi(1); join(3, "\\left\\{", ts[1], "\\right\\}"); push(ts[0]); }
;
func_bracket: ABS reduce { popi(1); join(3, "\\left|", ts[1], "\\right|"); push(ts[0]); }
| NRM reduce { popi(1); join(3, "\\left\\|", ts[1], "\\right\\|"); push(ts[0]); }
| BRA reduce { popi(1); join(3, "\\left\\langle", ts[1], "\\right|"); push(ts[0]); }
| KET reduce { popi(1); join(3, "\\left|", ts[1], "\\right\\rangle"); push(ts[0]); }
| INN reduce { popi(1); join(3, "\\left\\langle", ts[1], "\\right\\rangle"); push(ts[0]); }
| FLR reduce { popi(1); join(3, "\\left\\lfloor", ts[1], "\\right\\rfloor"); push(ts[0]); }
| CIL reduce { popi(1); join(3, "\\left\\lceil", ts[1], "\\right\\rceil"); push(ts[0]); }
| RND reduce { popi(1); join(3, "\\left\\lfloor", ts[1], "\\right\\rceil"); push(ts[0]); }
;

over: OOVR reduce { popi(1); join(4, (char*)$1, "{", ts[1], "}"); push(ts[0]); }
;

piece: subpiece
| subpiece POW reduce { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); }
;
subpiece: single
| subsingle
;
subsingle: single OB sentence CB { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); }
| subsingle OB sentence CB { popi(2); ts[2][strlen(ts[2])-1] = '\0'; join(4, ts[2], ",", ts[1], "}"); push(ts[0]); }
;

single: number
| variable
| symbol
| text
| alignment

| matrix
| subbracket
| func_bracket
| root
| over
;
number: NUMBER { push((char*)$1); }
| REPEAT { strcpy(ts[1], (char*)$1); ts[1][strlen(ts[1])-3] = '\0'; register int i = strrchr(ts[1], '.') - ts[1] + 1; strcpy(ts[2], (char*)ts[1]+i); ts[1][i-3] = '\0'; join(4, ts[1], "\\overline{", ts[2], "}"); push(ts[0]); }
;
variable: ENGL { join(2, " ", (char*)$1); push(ts[0]); }
| GREEK { join(2, "\\", (char*)$1); push(ts[0]); }
| NSET { push((char*)$1); }
| NOVR { push((char*)$1); }
;
text: TEXT { strcpy(ts[1], (char*)$1+1); ts[1][strlen(ts[1])-1] = '\0'; join(3, "\\text{", ts[1], "}"); push(ts[0]); }
| PUNCT { push((char*)$1); }
| PSEUDO { join(3, "\\mathbf{\\text{", (char*)$1, "}}"); push(ts[0]); }
| NAME { join(3, "\\operatorname{", (char*)$1, "}"); push(ts[0]); }
| FUNC { join(2, "\\", (char*)$1); push(ts[0]); }
| INVFUNC { if(strlen((char*)$1)<6) join(3, "\\", (char*)$1+1, "^{-1}"); else join(3, "\\", (char*)$1+3, "^{-1}"); push(ts[0]); }
| LATEX { strcpy(ts[1], (char*)$1+2); ts[1][strlen(ts[1])-1] = '\0'; push(ts[1]); }
;
symbol: SOPT { push((char*)$1); }
| SOTH { push((char*)$1); }
| SLGC { push((char*)$1); }
| SSET { push((char*)$1); }
| SEQV { push((char*)$1); } /* wait to be clean up here! */
;
alignment: SPC { push("\\;\\;"); }
| TAB { push("\\quad\\quad"); }
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
  exit(0);
}
