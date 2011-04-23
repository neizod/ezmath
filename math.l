%{
#include "math.tab.h"
%}

%%

"+"	{ yylval = 0; return OPRT; }
"-"	{ yylval = 1; return OPRT; }
"*"	{ yylval = 2; return OPRT; }
"."     { yylval = 3; return OPRT; }
"~"     { yylval = 4; return OPRT; }
"!"     { yylval = 5; return OPRT; }
"+-"    { yylval = 6; return OPRT; }
"-+"    { yylval = 7; return OPRT; }

"(+)"   { yylval = 8; return OPRT; }
"(-)"   { yylval = 9; return OPRT; }
"(*)"   { yylval = 10; return OPRT; }
"(.)"   { yylval = 11; return OPRT; }
"(/)"   { yylval = 12; return OPRT; }

"/"	{ return DIV; }
"^"     { return POW; }

"sqrt"  { return SQRT; }
"root"  { return ROOT; }

"sin"    { yylval = 0; return NAME; }
"cos"    { yylval = 1; return NAME; }
"tan"    { yylval = 2; return NAME; }
"cot"    { yylval = 3; return NAME; }
"sec"    { yylval = 4; return NAME; }
"csc"    { yylval = 5; return NAME; }
"asin"   |
"arcsin" { yylval = 6; return NAME; }
"acos"   |
"arccos" { yylval = 7; return NAME; }
"atan"   |
"arctan" { yylval = 8; return NAME; }
"acot"   |
"arccot" { yylval = 9; return NAME; }
"asec"   |
"arcsec" { yylval = 10; return NAME; }
"acsc"   |
"arccsc" { yylval = 11; return NAME; }
"exp"    { yylval = 0; return NAME; /*


"mod"   "\\bmod"
*/ }

"="     { yylval = 0; return EQVL; }
"!="    { yylval = 1; return EQVL; }
"<"     { yylval = 2; return EQVL; }
">"     { yylval = 3; return EQVL; }
"<<"    { yylval = 4; return EQVL; }
">>"    { yylval = 5; return EQVL; }
"<="    { yylval = 6; return EQVL; }
">="    { yylval = 7; return EQVL; }
"~~"    { yylval = 8; return EQVL; }

"~="    { yylval = 9; return EQVL; }
"=="    { yylval = 10; return EQVL; }
"->"    { yylval = 11; return EQVL; }
"<->"   { yylval = 12; return EQVL; }
"and"   { yylval = 13; return EQVL; }
"or"    { yylval = 14; return EQVL; }
"not"   { yylval = 15; return EQVL; }



"("     { return OP; }
")"     { return CP; }

^"["    |
" ["    { return OB_M; }
"["     { return OB; }
"]"     { return CB; }


","     { return SEP; }
";"     { return SNL; }


[0-9]+(\.[0-9]+)?  { yylval = (int)yytext; return NUMBER; }



"alpha"    |
"beta"     |
"gamma"    |
"delta"    |
"epsilon"  |
"zeta"     |
"eta"      |
"theta"    |
"iota"     |
"kappa"    |
"lambda"   |
"mu"       |
"nu"       |
"xi"       |
"pi"       |
"rho"      |
"sigma"    |
"varsigma" |
"tau"      |
"upsilon"  |
"phi"      |
"varphi"   |
"chi"      |
"psi"      |
"omega"    { yylval = (int)yytext; return GREEK; }

"Alpha"    |
"Beta"     |
"Gamma"    |
"Delta"    |
"Epsilon"  |
"Zeta"     |
"Eta"      |
"Theta"    |
"Iota"     |
"Kappa"    |
"Lambda"   |
"Mu"       |
"Nu"       |
"Xi"       |
"Pi"       |
"Rho"      |
"Sigma"    |
"Tau"      |
"Upsilon"  |
"Phi"      |
"Chi"      |
"Psi"      |
"Omega"    { yylval = (int)yytext; return GREEK; }

[a-zA-Z]   { yylval = (int)yytext; return ENGL; }

"Eset"     { yylval = 0; return SET; }
"Nset"     { yylval = 1; return SET; }
"Zset"     { yylval = 2; return SET; }
"Qset"     { yylval = 3; return SET; }
"Rset"     { yylval = 4; return SET; }
"Cset"     { yylval = 5; return SET; }
"aleph"    |
"Aleph"    { yylval = 6; return SET; }

"inf"      |
"Inf"      |
"infty"    |
"infinity" |
"Infinity" { yylval = 7; return SET; }

"..."      { yylval = 8; return SET; }

"all"      |
"forall"   |
"for all"  { yylval = 9; return SET; }
"exists"   { yylval = 10; return SET; }

"in"       { yylval = 11; return SET; }
"notin"    |
"not in"   { yylval = 12; return SET; }
"subset"   { yylval = 13; return SET; }
"supset"   |
"superset" { yylval = 14; return SET; }

"union"    |
"cup"      { yylval = 15; return SET; }
"intersect"    |
"intersection" |
"cap"      { yylval = 16; return SET; }



"sum"      |
"Sum"      |
"sumation" |
"Sumation" { yylval = 0; return SUM; }

"prod"     |
"Prod"     |
"product"  |
"Product"  { yylval = 1; return SUM; }

"int"      |
"Int"      |
"integral" |
"Integral" { yylval = 2; return SUM; }

"from"     { return FROM; }
"to"       { return TO; }



\n	{ return EOL; }
"_"     { return SPACE; }
[ \t]	{ }
.	{ printf("Unknown: %c\n", *yytext); }

%%