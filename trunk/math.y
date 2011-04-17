%{
#include <stdio.h>
#include <string.h>


char latex[1024] = "\\[\n";

int stak_i = 0;
char stak_str[64][1024];
char ts[16][1024];

void push(str)
  char str[1024];
  {
    strcpy(stak_str[stak_i++], str);
  }
void pop(str)
  char str[1024];
  {
    strcpy(str, stak_str[--stak_i]);
  }

char* dGreek[2] = {"\\alpha", "\\beta"};

%}

/*
%token N0 N1 N2 N3 N4 N5 N6 N7 N8 N9
*/

%token NUM VAR GREEK
%token ADD SUB MUL DOT DIV POW
%token EQI NEQ
%token OP CP
%token EOL

%%

list: /* nothing */
| list equation EOL { pop(ts[0]); strcat(latex, ts[0]); strcat(latex, "\n"); printf(">>> %s\n", ts[0]); }
;

equation: exp
| equation EQI exp { pop(ts[0]); pop(ts[1]); strcat(ts[1], " = "); strcat(ts[1], ts[0]); push(ts[1]); printf("::: %s\n", ts[1]); }
| equation NEQ exp { pop(ts[0]); pop(ts[1]); strcat(ts[1], " \\neg "); strcat(ts[1], ts[0]); push(ts[1]); printf("::: %s\n", ts[1]); }
;

exp: factor
| exp ADD factor { pop(ts[0]); pop(ts[1]); strcat(ts[1], " + "); strcat(ts[1], ts[0]); push(ts[1]); printf("::: %s\n", ts[1]); }
| exp SUB factor { pop(ts[0]); pop(ts[1]); strcat(ts[1], " - "); strcat(ts[1], ts[0]); push(ts[1]); printf("::: %s\n", ts[1]); }
;

factor: term
| factor MUL term { pop(ts[0]); pop(ts[1]); strcat(ts[1], " \\times "); strcat(ts[1], ts[0]); push(ts[1]); printf("::: %s\n", ts[1]); }
| factor DOT term { pop(ts[0]); pop(ts[1]); strcat(ts[1], " \\cdot "); strcat(ts[1], ts[0]); push(ts[1]); printf("::: %s\n", ts[1]); }
| factor term { pop(ts[0]); pop(ts[1]); strcat(ts[1], ts[0]); push(ts[1]); printf(":: %s\n", ts[1]); }
/*
| factor DIV OP exp CP { pop(ts[0]); pop(ts[1]); strcpy(ts[2], " \\frac{"); strcat(ts[2], ts[1]); strcat(ts[2], "}{"); strcat(ts[2], ts[0]); strcat(ts[2], "} ");  push(ts[2]); printf("::: %s\n", ts[2]); }
*/
| factor DIV term { pop(ts[0]); pop(ts[1]); strcpy(ts[2], " \\frac{"); strcat(ts[2], ts[1]); strcat(ts[2], "}{"); strcat(ts[2], ts[0]); strcat(ts[2], "} ");  push(ts[2]); printf("::: %s\n", ts[2]); }
;

term: NUM { push("n"); }
| VAR { push("v"); }
| GREEK { push(dGreek[$$]); }
/*
| exp POW OP exp CP { pop(ts[0]); pop(ts[1]); strcat(ts[1], "^{"); strcat(ts[1], ts[0]); strcat(ts[1], "}"); push(ts[1]); printf("::: %s\n", ts[1]); }
| exp POW exp { pop(ts[0]); pop(ts[1]); strcat(ts[1], "^{"); strcat(ts[1], ts[0]); strcat(ts[1], "}"); push(ts[1]); printf("::: %s\n", ts[1]); }
*/
| OP exp CP { pop(ts[0]); strcpy(ts[1], "("); strcat(ts[1], ts[0]); strcat(ts[1], ")"); push(ts[1]); printf("::: %s\n", ts[1]); }
;

/*
number: digit { strcpy(left, node); printf("at digit"); }
| number digit { strcpy(right, node); strcpy(node, left); strcat(node, right); printf("at number"); }
;

digit: N0 { strcpy(node, "0"); printf("at N0"); } 
| N1 { strcpy(node, "1"); }
| N2 | N3 | N4 | N5 | N6 | N7 | N8 | N9
;
*/

%%

main(int argc, char **argv)
{
  
  yyparse();
  strcat(latex, "\\]");
  printf("%s\n", latex);
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
