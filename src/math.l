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


"and"	{ yylval = 0; return SLGC; }
"or"	{ yylval = 1; return SLGC; }
"not"	{ yylval = 2; return SLGC; }
"<->"	{ yylval = 3; return SLGC; }
"<-->"	{ yylval = 4; return SLGC; }
"->"	{ yylval = 5; return SLGC; }
"-->"	{ yylval = 6; return SLGC; }
"<-"	{ yylval = 7; return SLGC; }
"<--"	{ yylval = 8; return SLGC; }
"<=>"	{ yylval = 9; return SLGC; }
"<==>"	{ yylval = 10; return SLGC; }
"=>"	{ yylval = 11; return SLGC; }
"==>"	{ yylval = 12; return SLGC; }
"<=="	{ yylval = 13; return SLGC; }


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


exp	|
log	|
ln	|
max	|
min	|
gcd	|
det	|

sinh?	|
cosh?	|
tanh?	|
coth?	|
sech?	|
csch?	{ yylval = (int)yytext; return FUNC; }

a(rc)?sinh?	|
a(rc)?cosh?	|
a(rc)?tanh?	|
a(rc)?coth?	|
a(rc)?sech?	|
a(rc)?csch?	{ yylval = (int)yytext; return INVFUNC; }

lcm	|
sgn	|
cases?	{ yylval = (int)yytext; return NAME; }



(A|a)lpha	|
(B|b)eta	|
(G|g)amma	|
(D|d)elta	|
(E|(var)?e)psilon	|
(Z|z)eta	|
(E|e)ta	|
(T|(var)?t)heta	|
(I|i)ota	|
(K|k)appa	|
(L|l)ambda	|
(M|m)u	|
(N|n)u	|
(X|x)i	|
(P|(var)?p)i	|
(R|(var)?r)ho	|
(S|(var)?s)igma	|
(T|t)au	|
(U|u)psilon	|
(P|(var)?p)hi	|
(C|c)hi	|
(P|p)si	|
(O|o)mega	{ yylval = (int)yytext; return GREEK; }

[a-zA-Z]	{ yylval = (int)yytext; return ENGL; }
[':!@\?\$]	{ yylval = (int)yytext; return PUNCT; }
[%&]	{ yylval = (int)yytext; return ESCCH; }

[0-9]+(\.[0-9]+"..."?)?	{ yylval = (int)yytext; return NUMBER; }

\"[^\"]*\" { yylval = (int)yytext; return TEXT; }



"("	{ return OP; }
")"	{ return CP; }

"{"	{ return OS; }
"}"	{ return CS; }

^"["	|
[ \t]"["	{ return OB_M; }
"det ["	{ return OB_D; }
"parentheses ["	{ return OB_P; }
"case ["	|
"cases ["	{ return OB_C; }
"["	{ return OB; }
"]"	{ return CB; }



"/"	{ return DIV; }
"^"	{ return POW; }
"choose"	{ return CHS; }
"root"	{ return NRT; }
"sqrt"	{ return SRT; }

"mod"	{ return MOD; }
"floor"	{ return FLR; }
"ceil"	|
"ceiling"	{ return CIL; }
"round"	{ return RND; }


"hati"	|
"hat i"	|
"hat(i)"	{ yylval = 0; return NOVR; }
"hatiota"	|
"hat iota"	{ yylval = 1; return NOVR; }
"hatj"	|
"hat j"	|
"hat(j)"	{ yylval = 2; return NOVR; }
"veci"	|
"vec i"	|
"vec(i)"	{ yylval = 3; return NOVR; }
"veciota"	|
"vec iota"	{ yylval = 4; return NOVR; }
"vecj"	|
"vec j"	|
"vec(j)"	{ yylval = 5; return NOVR; }
"bari"	|
"bar i"	|
"bar(i)"	{ yylval = 6; return NOVR; }
"bariota"	|
"bar iota"	{ yylval = 7; return NOVR; }
"barj"	|
"bar j"	|
"bar(j)"	{ yylval = 8; return NOVR; }


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
\n	{ return EOL; }
[ \t]	{ /* do nothing */ }
.	{ printf("Unknown: %c\n", *yytext); }

%%
