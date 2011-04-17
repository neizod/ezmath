%{
#include "math.tab.h"
%}

%%

"+"	{ return ADD; }
"-"	{ return SUB; }
"*"	{ return MUL; }
"."     { return DOT; }
"/"	{ return DIV; }
"^"     { return POW; }

"="     { return EQI; }
"!="    { return NEQ; }

"("     { return OP; }
")"     { return CP; }

[0-9]+	{ yylval = atoi(yytext); return NUM; }

"alpha"   { yylval = 0; return GREEK; }
"beta"    { yylval = 1; return GREEK; }
"gamma"   { return GREEK; }
"delta"   { return GREEK; }
"epsilon" { return GREEK; }
"zeta"    { return GREEK; }
"eta"     { return GREEK; }
"theta"   { return GREEK; }
"iota"    { return GREEK; }
"kappa"   { return GREEK; }
"lambda"  { return GREEK; }
"mu"      { return GREEK; }
"nu"      { return GREEK; }
"xi"      { return GREEK; }
"pi"      { return GREEK; }
"rho"     { return GREEK; }
"sigma"   { return GREEK; }
"tau"     { return GREEK; }
"upsilon" { return GREEK; }
"phi"     { return GREEK; }
"chi"     { return GREEK; }
"psi"     { return GREEK; }
"omega"   { return GREEK; }



[a-z]  { return VAR; }






\n	{ return EOL; }
[ \t]	{ }
.	{ printf("UNK[%c]\n", *yytext); }



%%