%{
#include "math.tab.h"
%}

%%

"+"	{ yylval = 0; return SOPT; }
"-"	{ yylval = 1; return SOPT; }
"*"	{ yylval = 2; return SOPT; }
"."	{ yylval = 3; return SOPT; }
"ast"	{ yylval = 4; return SOPT; }
"//"	{ yylval = 5; return SOPT; }

"(+)"	{ yylval = 6; return SOPT; }
"(-)"	{ yylval = 7; return SOPT; }
"(*)"	{ yylval = 8; return SOPT; }
"(.)"	{ yylval = 9; return SOPT; }
"(ast)"	{ yylval = 10; return SOPT; }
"(/)"	{ yylval = 11; return SOPT; }

"+-"	{ yylval = 12; return SOPT; }
"-+"	{ yylval = 13; return SOPT; }

"~"	{ yylval = 14; return SOPT; }
"degree"	{ yylval = 15; return SOPT; }
"star"	{ yylval = 16; return SOPT; }

"||"	{ yylval = 17; return SOPT; }
"|"	{ yylval = 18; return SOPT; }

"="	{ yylval = 0; return SEQV; }
"=="	{ yylval = 1; return SEQV; }
"~="	{ yylval = 2; return SEQV; }
"~~"	{ yylval = 3; return SEQV; }
"propto"	{ yylval = 4; return SEQV; }
"!="	{ yylval = 5; return SEQV; }
"<"	{ yylval = 6; return SEQV; }
">"	{ yylval = 7; return SEQV; }
"<<"	{ yylval = 8; return SEQV; }
">>"	{ yylval = 9; return SEQV; }
"<="	{ yylval = 10; return SEQV; }
">="	{ yylval = 11; return SEQV; }
"-<"	{ yylval = 12; return SEQV; }
">-"	{ yylval = 13; return SEQV; }


"<-"	{ yylval = 0; return SLGC; }
"->"	{ yylval = 1; return SLGC; }
"<->"	{ yylval = 2; return SLGC; }
"=>"	{ yylval = 3; return SLGC; }
"<=>"	{ yylval = 4; return SLGC; }
"and"	{ yylval = 5; return SLGC; }
"or"	{ yylval = 6; return SLGC; }
"not"	{ yylval = 7; return SLGC; }


"..."	{ yylval = 0; return SOTH; }
"inf"	|
"Inf"	|
"infty"	|
"infinity"	|
"Infinity"	{ yylval = 1; return SOTH; }

"part"	|
"partial"	{ yylval = 2; return SOTH; }
"grad"	|
"nabla"	{ yylval = 3; return SOTH; }


"all"	|
"forall"	|
"for all"	{ yylval = 0; return SSET; }
"exists"	{ yylval = 1; return SSET; }

"in"	{ yylval = 2; return SSET; }
"notin"	|
"not in"	{ yylval = 3; return SSET; }
"subset"	{ yylval = 4; return SSET; }
"supset"	|
"superset" { yylval = 5; return SSET; }

"union"	|
"cup"	{ yylval = 6; return SSET; }
"intersect"	|
"intersection" |
"cap"	{ yylval = 7; return SSET; }
"\\"	{ yylval = 8; return SSET; }


"empty"	{ yylval = 0; return NSET; }
"Eset"	{ yylval = 1; return NSET; }
"Nset"	{ yylval = 2; return NSET; }
"Zset"	{ yylval = 3; return NSET; }
"Pset"	{ yylval = 4; return NSET; }
"Qset"	{ yylval = 5; return NSET; }
"Rset"	{ yylval = 6; return NSET; }
"Cset"	{ yylval = 7; return NSET; }
"Hset"	{ yylval = 8; return NSET; }
"aleph"	|
"Aleph"	{ yylval = 9; return NSET; }
"Re"	{ yylval = 10; return NSET; }
"Im"	{ yylval = 11; return NSET; }


"sin"	{ yylval = 0; return NTRI; }
"cos"	{ yylval = 1; return NTRI; }
"tan"	{ yylval = 2; return NTRI; }
"cot"	{ yylval = 3; return NTRI; }
"sec"	{ yylval = 4; return NTRI; }
"csc"	{ yylval = 5; return NTRI; }
"asin"	|
"arcsin"	{ yylval = 6; return NTRI; }
"acos"	|
"arccos"	{ yylval = 7; return NTRI; }
"atan"	|
"arctan"	{ yylval = 8; return NTRI; }
"acot"	|
"arccot"	{ yylval = 9; return NTRI; }
"asec"	|
"arcsec"	{ yylval = 10; return NTRI; }
"acsc"	|
"arccsc"	{ yylval = 11; return NTRI; }

"sinh"	{ yylval = 0; return NHYB; }
"cosh"	{ yylval = 1; return NHYB; }
"tanh"	{ yylval = 2; return NHYB; }
"coth"	{ yylval = 3; return NHYB; }
"sech"	{ yylval = 4; return NHYB; }
"csch"	{ yylval = 5; return NHYB; }
"asinh"	|
"arcsinh" { yylval = 6; return NHYB; }
"acosh"	|
"arccosh" { yylval = 7; return NHYB; }
"atanh"	|
"arctanh" { yylval = 8; return NHYB; }
"acoth"	|
"arccoth" { yylval = 9; return NHYB; }
"asech"	|
"arcsech" { yylval = 10; return NHYB; }
"acsch"	|
"arccsch" { yylval = 11; return NHYB; }


"exp"	{ yylval = 0; return NEXP; }
"log"	{ yylval = 1; return NEXP; }
"ln"	{ yylval = 2; return NEXP; }


"sgn"	{ yylval = 0; return NOTH; }
"max"	{ yylval = 1; return NOTH; }
"min"	{ yylval = 2; return NOTH; }
"gcd"	{ yylval = 3; return NOTH; }
"lcm"	{ yylval = 4; return NOTH; }
"det"	{ yylval = 5; return NOTH; }



"alpha"	|
"beta"	|
"gamma"	|
"delta"	|
"epsilon"	|
"zeta"	|
"eta"	|
"theta"	|
"iota"	|
"kappa"	|
"lambda"	|
"mu"	|
"nu"	|
"xi"	|
"pi"	|
"rho"	|
"sigma"	|
"tau"	|
"upsilon"	|
"phi"	|
"chi"	|
"psi"	|
"omega"	{ yylval = (int)yytext; return GREEK; }

"varepsilon"	|
"vartheta"	|
"varpi"	|
"varrho"	|
"varsigma"	|
"varphi"	{ yylval = (int)yytext; return GREEK; }

"Alpha"	|
"Beta"	|
"Gamma"	|
"Delta"	|
"Epsilon"	|
"Zeta"	|
"Eta"	|
"Theta"	|
"Iota"	|
"Kappa"	|
"Lambda"	|
"Mu"	|
"Nu"	|
"Xi"	|
"Pi"	|
"Rho"	|
"Sigma"	|
"Tau"	|
"Upsilon"	|
"Phi"	|
"Chi"	|
"Psi"	|
"Omega"	{ yylval = (int)yytext; return GREEK; }

[a-zA-Z]	{ yylval = (int)yytext; return ENGL; }
[':!@\?\$]	{ yylval = (int)yytext; return PUNCT; }
[%&]	{ yylval = (int)yytext; return ESCCH; }

[0-9]+(\.[0-9]+(\.\.\.)?)?	{ yylval = (int)yytext; return NUMBER; }

\"[^\"]*\" { yylval = (int)yytext; return TEXT; }



"("	{ return OP; }
")"	{ return CP; }

"{"	{ return OS; }
"}"	{ return CS; }

^"["	|
[ \t]"["	{ return OB_M; }
"det["	{ return OB_D; }
"["	{ return OB; }
"]"	{ return CB; }
"\|["	{ return OL_M; }
"]\|"	{ return CL_M; }
"\|\|["	{ return OL_D; }
"]\|\|"	{ return CL_D; }



"/"	{ return DIV; }
"^"	{ return POW; }
"choose"	{ return CHS; }
"root"	{ return NRT; }
"sqrt"	{ return SRT; }

"mod"	{ return MOD; }
"floor"	{ return FLR; }
"ceil"	{ return CIL; }
"round"	{ return RND; }

"case"	|
"cases"	{ return SWC; }


"hati"	|
"hat i"	|
"hat(i)"	{ yylval = 0; return NOVR; }
"hatj"	|
"hat j"	|
"hat(j)"	{ yylval = 1; return NOVR; }
"veci"	|
"vec i"	|
"vec(i)"	{ yylval = 2; return NOVR; }
"vecj"	|
"vec j"	|
"vec(j)"	{ yylval = 3; return NOVR; }
"bari"	|
"bar i"	|
"bar(i)"	{ yylval = 4; return NOVR; }
"barj"	|
"bar j"	|
"bar(j)"	{ yylval = 5; return NOVR; }


"dot"	{ yylval = 0; return OOVR; }
"ddot"	{ yylval = 1; return OOVR; }
"hat"	{ yylval = 2; return OOVR; }
"vec"	{ yylval = 3; return OOVR; }
"bar"	{ yylval = 4; return OOVR; }


"sum"	|
"Sum"	|
"sumation" |
"Sumation" { yylval = 0; return OSUM; }

"prod"	|
"Prod"	|
"product"	|
"Product"	{ yylval = 1; return OSUM; }

"coprod"	|
"Coprod"	|
"coproduct"	|
"Coproduct"	{ yylval = 2; return OSUM; }

"Union"	|
"Cup"	{ yylval = 3; return OSUM; }
"Intersect"	|
"Intersection"	|
"Cap"	{ yylval = 4; return OSUM; }

"lim"	{ yylval = 5; return OSUM; }

"int"	|
"Int"	|
"integral" |
"Integral" { yylval = 6; return OSUM; }

"oint"	|
"Oint"	|
"ointegral"	|
"Ointegral"	{ yylval = 7; return OSUM; }

"iint"	{ yylval = 8; return OSUM; }
"iiint"	{ yylval = 9; return OSUM; }


"from"	{ return FR; }
"to"	{ return TO; }
"when"	|
"where"	{ return WH; }


"_"	{ return SPC; }
","	{ return SEP; }
";"	{ return SNL; }
"#"	{ return ALG; }
\r?\n	{ /* return EOL; */ }
[ \t]	{ }
.	{ printf("Unknown: %c\n", *yytext); }

%%