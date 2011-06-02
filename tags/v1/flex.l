%{
#include "bison.tab.h"
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
deg(ree)?	{ yylval = 15; return SOPT; }
star	{ yylval = 16; return SOPT; }

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
(I|i)nf((ini)?ty)?	{ yylval = 1; return SOTH; }

part(ial)?	{ yylval = 2; return SOTH; }
"grad"	|
"nabla"	{ yylval = 3; return SOTH; }


(for[ ]?)?all	{ yylval = 0; return SSET; }
"exists"	{ yylval = 1; return SSET; }

in	{ yylval = 2; return SSET; }
not[ ]?in	{ yylval = 3; return SSET; }
subset	{ yylval = 4; return SSET; }
sup(er)?set	{ yylval = 5; return SSET; }

"union"	|
"cup"	{ yylval = 6; return SSET; }
intersect(ion)?	|
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
(A|a)leph	{ yylval = 9; return NSET; }
"Re"	{ yylval = 10; return NSET; }
"Im"	{ yylval = 11; return NSET; }


exp	|
log	|
ln	|
max	|
min	|
gcd	|
det	|
mod	|

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
rad	|
cases?	{ yylval = (int)yytext; return NAME; }


begin	|
end	|

if	|
do	|
od	|
then	|
else	|
el(se[ ])?if	|
end[ ]if	|
fi	|

for	|
end[ ]for	|
upto	|
downto	|
step	|
while	|
end[ ]while	|
loop	|
end[ ]loop	|
repeat	|
until	|

var	|
function	|
procedure	|
comment	|
print	|
return	{ yylval = (int)yytext; return PSEUDO; }



(i|j)math	|

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
[%&]	{ yylval = (int)yytext; return FUNC; }

[0-9]+\.[0-9]*"..."[0-9]+"..."	{ yylval = (int)yytext; return REPEAT; }
[0-9]+(\.[0-9]+"..."?)?	{ yylval = (int)yytext; return NUMBER; }

\"[^\"]*\"	{ yylval = (int)yytext; return TEXT; }
@\"[^\"]*\"	{ yylval = (int)yytext; return LATEX; }


"("[ ]?mod	{ return OP_M; }
"("	{ return OP; }
")"	{ return CP; }

"{"	{ return OS; }
"}"	{ return CS; }

^"["	|
(bmatrix[ ]|[ \t])"["	{ return OB_M; }
(vmatrix|det)" ["	{ return OB_D; }
(Vmatrix)" ["	{ return OB_V; }
(pmatrix|parentheses)" ["	{ return OB_P; }
cases?" ["	{ return OB_C; }
"["	{ return OB; }
"]"	{ return CB; }



"/"	{ return DIV; }
"^"	{ return POW; }
"choose"	{ return CHS; }
"root"	{ return NRT; }
"sqrt"	{ return SRT; }

abs	{ return ABS; }
norm	{ return NRM; }
floor	{ return FLR; }
ceil(ing)?	{ return CIL; }
round	{ return RND; }



hat[ ]?(i(math)?|"(i)")	{ yylval = 0; return NOVR; }
hat[ ]?iota	{ yylval = 1; return NOVR; }
hat[ ]?(j(math)?|"(j)")	{ yylval = 2; return NOVR; }
vec[ ]?(i(math)?|"(i)")	{ yylval = 3; return NOVR; }
vec[ ]?iota	{ yylval = 4; return NOVR; }
vec[ ]?(j(math)?|"(j)")	{ yylval = 5; return NOVR; }
bar[ ]?(i(math)?|"(i)")	{ yylval = 6; return NOVR; }
bar[ ]?iota	{ yylval = 7; return NOVR; }
bar[ ]?(j(math)?|"(j)")	{ yylval = 8; return NOVR; }

"dot"	{ yylval = 0; return OOVR; }
"ddot"	{ yylval = 1; return OOVR; }
"hat"	{ yylval = 2; return OOVR; }
"vec"	{ yylval = 3; return OOVR; }
"bar"	{ yylval = 4; return OOVR; }


(S|s)um(mation)?	{ yylval = 0; return OSUM; }
(P|p)rod(uct)?	{ yylval = 1; return OSUM; }
(C|c)oprod(uct)?	{ yylval = 2; return OSUM; }

"Union"	|
"Cup"	{ yylval = 3; return OSUM; }
Intersect(ion)?	|
"Cap"	{ yylval = 4; return OSUM; }

"lim"	{ yylval = 5; return OSUM; }

(I|i)nt(egral)?	{ yylval = 6; return OSUM; }
(O|o)(I|i)nt(egral)?	{ yylval = 7; return OSUM; }
(I|i){2}nt(egral)?	{ yylval = 8; return OSUM; }
(I|i){3}nt(egral)?	{ yylval = 9; return OSUM; }


"from"	{ return FR; }
"to"	{ return TO; }
"when"	|
"where"	{ return WH; }


"_"	{ return SPC; }
"__"	{ return TAB; }
","	{ return SEP; }
";"	{ return SNL; }
"#"	{ return ALG; }
\n	{ return EOL; }
[ \t]	{ /* do nothing */ }
.	{ printf("Unknown: %c\n", *yytext); }

%%
