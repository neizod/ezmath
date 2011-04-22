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
"/"	{ return DIV; }
"^"     { return POW; }



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
"&&"    { yylval = 13; return EQVL; }
"||"    { yylval = 14; return EQVL; }



"("     { return OP; }
")"     { return CP; }

^"["    |
" ["    { return OB_M; }
"["     { return OB; }
"]"     { return CB; }



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

"inf"      |
"Inf"      |
"infty"    |
"infinity" |
"Infinity" { yylval = 6; return SET; }

"..."      { yylval = 7; return SET; }

"all"      |
"forall"   |
"for all"  { yylval = 8; return SET; }
"exists"   { yylval = 9; return SET; }
"exist"    { yylval = 10; return SET; }

"aleph"    |
"Aleph"    { }



"int"      { return INT; }
"sum"      { return SUM; }
"prod"     { return PROD; }

"from"     { return FROM; }
"to"       { return TO; }



\n	{ return EOL; }
[ \t]	{ }
.	{ printf("Unknown: %c\n", *yytext); }

%%