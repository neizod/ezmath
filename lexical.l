%{
#include "parser.tab.h"
%}

%%

"+"	{ yylval = (int)"+"; return SOPT; }
"-"	{ yylval = (int)"-"; return SOPT; }
"*"	{ yylval = (int)"\\times"; return SOPT; }
"."	{ yylval = (int)"\\cdot"; return SOPT; }
"ast"	{ yylval = (int)"*"; return SOPT; }
"//"	{ yylval = (int)"\\div"; return SOPT; }

"(+)"	{ yylval = (int)"\\oplus"; return SOPT; }
"(-)"	{ yylval = (int)"\\ominus"; return SOPT; }
"(*)"	{ yylval = (int)"\\otimes"; return SOPT; }
"(.)"	{ yylval = (int)"\\odot"; return SOPT; }
"(ast)"	{ yylval = (int)"\\circleast"; return SOPT; }
"(/)"	{ yylval = (int)"\\oslash"; return SOPT; }

"+-"	{ yylval = (int)"\\pm"; return SOPT; }
"-+"	{ yylval = (int)"\\mp"; return SOPT; }

"~"	{ yylval = (int)"\\sim"; return SOPT; }
deg(ree)?	{ yylval = (int)"{^\\circ}"; return SOPT; }
star	{ yylval = (int)"\\star"; return SOPT; }

"||"	{ yylval = (int)"\\|"; return SOPT; }
"|"	{ yylval = (int)"|"; return SOPT; }

"="	{ yylval = (int)"="; return SEQV; }
"=="	{ yylval = (int)"\\equiv"; return SEQV; }
"~="	{ yylval = (int)"\\cong"; return SEQV; }
"~~"	{ yylval = (int)"\\approx"; return SEQV; }
"propto"	{ yylval = (int)"\\propto"; return SEQV; }
"!="	{ yylval = (int)"\\neq"; return SEQV; }
"<"	{ yylval = (int)"\\lt"; return SEQV; }
">"	{ yylval = (int)"\\gt"; return SEQV; }
"<<"	{ yylval = (int)"\\ll"; return SEQV; }
">>"	{ yylval = (int)"\\gg"; return SEQV; }
"<="	{ yylval = (int)"\\leq"; return SEQV; }
">="	{ yylval = (int)"\\geq"; return SEQV; }
"-<"	{ yylval = (int)"\\prec"; return SEQV; }
">-"	{ yylval = (int)"\\succ"; return SEQV; }


"and"	{ yylval = (int)"\\land"; return SLGC; }
"or"	{ yylval = (int)"\\lor"; return SLGC; }
"not"	{ yylval = (int)"\\neg"; return SLGC; }
"<->"	{ yylval = (int)"\\leftrightarrow"; return SLGC; }
"<-->"	{ yylval = (int)"\\longleftrightarrow"; return SLGC; }
"->"	{ yylval = (int)"\\rightarrow"; return SLGC; }
"-->"	{ yylval = (int)"\\longrightarrow"; return SLGC; }
"<-"	{ yylval = (int)"\\leftarrow"; return SLGC; }
"<--"	{ yylval = (int)"\\longleftarrow"; return SLGC; }
"<=>"	{ yylval = (int)"\\Leftrightarrow"; return SLGC; }
"<==>"	{ yylval = (int)"\\Longleftrightarrow"; return SLGC; }
"=>"	{ yylval = (int)"\\Rightarrow"; return SLGC; }
"==>"	{ yylval = (int)"\\Longrightarrow"; return SLGC; }
"<=="	{ yylval = (int)"\\Longleftarrow"; return SLGC; }
"|->"	{ yylval = (int)"\\mapsto"; return SLGC; }


"..."	{ yylval = (int)"\\ldots"; return SOTH; }
(I|i)nf(ini)?ty	{ yylval = (int)"\\infty"; return SOTH; }

der	|
part(ial)?	{ yylval = (int)"\\partial"; return SOTH; }
grad	|
nabla	{ yylval = (int)"\\nabla"; return SOTH; }


(for" "?)?all	{ yylval = (int)"\\forall"; return SSET; }
exists	{ yylval = (int)"\\exists"; return SSET; }

in	{ yylval = (int)"\\in"; return SSET; }
not" "?in	{ yylval = (int)"\\notin"; return SSET; }
subset	{ yylval = (int)"\\subseteq"; return SSET; }
sup(er)?set	{ yylval = (int)"\\supseteq"; return SSET; }

union	|
cup	{ yylval = (int)"\\cup"; return SSET; }
intersect(ion)?	|
cap	{ yylval = (int)"\\cap"; return SSET; }
"\\"	{ yylval = (int)"\\setminus"; return SSET; }


empty	{ yylval = (int)"\\emptyset"; return NSET; }
Eset	{ yylval = (int)"\\varnothing"; return NSET; }
Nset	{ yylval = (int)"\\mathbb{N}"; return NSET; }
Zset	{ yylval = (int)"\\mathbb{Z}"; return NSET; }
Pset	{ yylval = (int)"\\mathbb{P}"; return NSET; }
Qset	{ yylval = (int)"\\mathbb{Q}"; return NSET; }
Rset	{ yylval = (int)"\\mathbb{R}"; return NSET; }
Cset	{ yylval = (int)"\\mathbb{C}"; return NSET; }
Hset	{ yylval = (int)"\\mathbb{H}"; return NSET; }
(A|a)leph	{ yylval = (int)"\\aleph"; return NSET; }
Re	{ yylval = (int)"\\Re"; return NSET; }
Im	{ yylval = (int)"\\Im"; return NSET; }


exp	|
log	|
ln	|

max	|
min	|
gcd	|

det	|
mod	|

inf	|
sup	|

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
el(se" ")?if	|
end" "if	|
fi	|

for	|
end" "for	|
upto	|
downto	|
step	|
while	|
end" "while	|
loop	|
end" "loop	|
repeat	|
until	|

var	|
function	|
procedure	|
comment	|
print	|
return	{ yylval = (int)yytext; return PSEUDO; }



hbar	|
(i|j)math	|
ell	|

alpha	|
beta	|
(G|g)amma	|
(D|d)elta	|
(var)?epsilon	|
zeta	|
eta	|
(T|(var)?t)heta	|
iota	|
kappa	|
(L|l)ambda	|
mu	|
nu	|
(X|x)i	|
omicron	|
(P|(var)?p)i	|
(var)?rho	|
(S|(var)?s)igma	|
tau	|
(U|u)psilon	|
(P|(var)?p)hi	|
chi	|
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
choose	{ return CHS; }
root	{ return NRT; }
sqrt	{ return SRT; }


abs	{ return ABS; }
norm	{ return NRM; }

bra	{ return BRA; }
ket	{ return KET; }
braket	|
inner	{ return INN; }

floor	{ return FLR; }
ceil(ing)?	{ return CIL; }
round	{ return RND; }



"hat(i)"	{ yylval = (int)"\\hat{\\imath}"; return NOVR; }
"hat(j)"	{ yylval = (int)"\\hat{\\jmath}"; return NOVR; }
"vec(i)"	{ yylval = (int)"\\overrightarrow{\\imath}"; return NOVR; }
"vec(j)"	{ yylval = (int)"\\overrightarrow{\\jmath}"; return NOVR; }
"bar(i)"	{ yylval = (int)"\\overline{\\imath}"; return NOVR; }
"bar(j)"	{ yylval = (int)"\\overline{\\jmath}"; return NOVR; }

dot	{ yylval = (int)"\\dot"; return OOVR; }
ddot	{ yylval = (int)"\\ddot"; return OOVR; }
hat	{ yylval = (int)"\\widehat"; return OOVR; }
vec	{ yylval = (int)"\\overrightarrow"; return OOVR; }
bar	{ yylval = (int)"\\overline"; return OOVR; }


(S|s)um(mation)?	{ yylval = (int)"\\sum"; return OSUM; }
(P|p)rod(uct)?	{ yylval = (int)"\\prod"; return OSUM; }
(C|c)oprod(uct)?	{ yylval = (int)"\\coprod"; return OSUM; }

Union	|
Cup	{ yylval = (int)"\\bigcup"; return OSUM; }
Intersect(ion)?	|
Cap	{ yylval = (int)"\\bigcap"; return OSUM; }

lim	{ yylval = (int)"\\lim"; return OSUM; }
lim" "?sup	{ yylval = (int)"\\limsup"; return OSUM; }
lim" "?inf	{ yylval = (int)"\\liminf"; return OSUM; }

(I|i)nt(egral)?	{ yylval = (int)"\\int"; return OSUM; }
(O|o)(I|i)nt(egral)?	{ yylval = (int)"\\oint"; return OSUM; }
(I|i){2}nt(egral)?	{ yylval = (int)"\\iint"; return OSUM; }
(I|i){3}nt(egral)?	{ yylval = (int)"\\iiint"; return OSUM; }


from	{ return FR; }
to	{ return TO; }
when	|
where	{ return WH; }


"_"	{ return SPC; }
"__"	{ return TAB; }
","	{ return SEP; }
";"	{ return SNL; }
"#"	{ return ALG; }
\n	{ return EOL; }
[ \t]	{ /* do nothing */ }
.	{ printf("Unknown: %c\n", *yytext); }

%%
