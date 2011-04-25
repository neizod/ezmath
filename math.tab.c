
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 1 "math.y"

#include <stdio.h>
#include <string.h>
#include <stdarg.h>


char latex[1024] = "\\begin{align}\n";

int stack_i = 0;
char stack_str[64][1024];
char ts[16][1024];

void dbs(void) {
  if(stack_i > 0)
    printf("(%3d)>>> %s\n", stack_i, ts[0]);
  else
    printf("(fin)::: %s\n", ts[0]);
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

 char* dSopt[17] = {"+", "-", "\\times", "\\cdot", "*", "\\div", "\\oplus", "\\ominus", "\\otimes", "\\odot", "\\circleast", "\\oslash", "\\pm", "\\mp", "\\sim", "{^\\circ}", "\\star"};
 char* dSeqv[14] = {"=", "\\equiv", "\\cong", "\\approx", "\\propto", "\\neq", "<", ">", "\\ll", "\\gg", "\\leg", "\\geg", "\\prec", "\\succ"};
 char* dSlgc[8] = {"\\leftarrow", "\\rightarrow", "\\leftrightarrow", "\\Rightarrow", "\\Leftrightarrow", "\\land", "\\lor", "\\neg"};
 char* dSoth[4] = {"\\lodts", "\\infty", "\\partial", "\\nabla"};
 char* dSset[9] = {"\\forall", "\\exists", "\\in", "\\notin", "\\subseteq", "\\supseteq", "\\cup", "\\cap", "\\setminus"};
 char* dNset[11] = {"\\emptyset", "\\mathbb{N}", "\\mathbb{Z}", "\\mathbb{P}" "\\mathbb{Q}", "\\mathbb{R}", "\\mathbb{C}", "\\mathbb{H}", "\\aleph", "\\Re", "\\Im"};
 char* dNtri[12] = {"\\sin", "\\cos", "\\tan", "\\cot", "\\sec", "\\csc", "\\sin^{-1}", "\\cos^{-1}", "\\tan^{-1}", "\\cot^{-1}", "\\sec^{-1}", "\\csc^{-1}"};
 char* dNhyb[12] = {"\\sinh", "\\cosh", "\\tanh", "\\coth", "\\sech", "\\csch", "\\sinh^{-1}", "\\cosh^{-1}", "\\tanh^{-1}", "\\coth^{-1}", "\\sech^{-1}", "\\csch^{-1}"};
 char* dNexp[3] = {"\\exp", "\\log", "\\ln"};
 char* dNoth[6] = {"\\operatorname{sgn}", "\\max", "\\min", "\\gcd", "\\operatorname{lcm}", "\\det"};
 char* dNovr[6] = {"\\hat{\\imath}", "\\hat{\\jmath}", "\\vec{\\imath}", "\\vec{\\jmath}", "\\overline{\\imath}", "\\overline{\\jmath}"};
 char* dOovr[5] = {"\\dot", "\\ddot", "\\hat", "\\vec", "\\overline"};
 char* dOsum[10] = {"\\sum", "\\prod", "\\coprod", "\\bigcup", "\\bigcap", "\\lim", "\\int", "\\oint", "\\iint", "\\iiint"};


/* Line 189 of yacc.c  */
#line 130 "math.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUMBER = 258,
     ENGL = 259,
     GREEK = 260,
     TEXT = 261,
     PUNCT = 262,
     ESCCH = 263,
     SOPT = 264,
     SEQV = 265,
     SLGC = 266,
     SOTH = 267,
     SSET = 268,
     NSET = 269,
     NTRI = 270,
     NHYB = 271,
     NEXP = 272,
     NOTH = 273,
     DIV = 274,
     POW = 275,
     CHS = 276,
     NRT = 277,
     SRT = 278,
     MOD = 279,
     FLR = 280,
     CIL = 281,
     RND = 282,
     SWC = 283,
     OSUM = 284,
     FR = 285,
     TO = 286,
     WH = 287,
     NOVR = 288,
     OOVR = 289,
     OP = 290,
     CP = 291,
     OS = 292,
     CS = 293,
     OB = 294,
     CB = 295,
     OB_M = 296,
     OL_M = 297,
     CL_M = 298,
     SPC = 299,
     SEP = 300,
     SNL = 301,
     EOL = 302
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 219 "math.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  2
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   786

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  48
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  35
/* YYNRULES -- Number of rules.  */
#define YYNRULES  85
/* YYNRULES -- Number of states.  */
#define YYNSTATES  123

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   302

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     4,     8,    10,    13,    15,    17,    19,
      23,    25,    30,    32,    34,    36,    38,    40,    42,    44,
      46,    48,    52,    54,    59,    61,    63,    65,    67,    69,
      71,    75,    79,    83,    88,    90,    93,    95,    97,    99,
     101,   104,   106,   108,   110,   113,   118,   121,   125,   129,
     132,   136,   139,   142,   145,   148,   151,   155,   159,   161,
     165,   167,   172,   174,   176,   178,   180,   182,   184,   186,
     188,   190,   192,   194,   196,   198,   200,   202,   204,   206,
     208,   210,   212,   214,   216,   218
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      49,     0,    -1,    -1,    49,    50,    47,    -1,    51,    -1,
      50,    51,    -1,    55,    -1,    52,    -1,    53,    -1,    53,
      20,    59,    -1,    54,    -1,    54,    39,    50,    40,    -1,
      45,    -1,    10,    -1,    74,    -1,    56,    -1,    63,    -1,
      68,    -1,    69,    -1,    70,    -1,    57,    -1,    57,    20,
      59,    -1,    58,    -1,    58,    39,    50,    40,    -1,    60,
      -1,    73,    -1,    67,    -1,    71,    -1,    72,    -1,    74,
      -1,    35,    50,    36,    -1,    41,    61,    40,    -1,    42,
      61,    43,    -1,    28,    35,    61,    36,    -1,    62,    -1,
      61,    62,    -1,    55,    -1,    45,    -1,    10,    -1,    64,
      -1,    64,    65,    -1,    29,    -1,    66,    -1,    50,    -1,
      50,    66,    -1,    30,    59,    31,    59,    -1,    32,    59,
      -1,    59,    21,    59,    -1,    59,    19,    59,    -1,    23,
      59,    -1,    59,    22,    59,    -1,    24,    59,    -1,    25,
      59,    -1,    26,    59,    -1,    27,    59,    -1,    34,    59,
      -1,    35,    50,    36,    -1,    37,    50,    38,    -1,    75,
      -1,    75,    20,    59,    -1,    76,    -1,    76,    39,    50,
      40,    -1,    77,    -1,    78,    -1,    79,    -1,    80,    -1,
      81,    -1,    82,    -1,     3,    -1,     4,    -1,     5,    -1,
      14,    -1,    33,    -1,    15,    -1,    16,    -1,    17,    -1,
      18,    -1,     9,    -1,    12,    -1,    11,    -1,    13,    -1,
       6,    -1,     7,    -1,     8,    -1,    44,    -1,    46,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    74,    74,    75,    78,    79,    82,    83,    85,    86,
      88,    89,    91,    92,    95,    96,    97,    98,    99,   100,
     102,   103,   105,   106,   108,   109,   110,   111,   112,   115,
     116,   119,   120,   121,   123,   124,   126,   127,   128,   131,
     132,   134,   136,   137,   138,   140,   141,   144,   146,   148,
     149,   151,   153,   154,   155,   157,   160,   161,   164,   165,
     170,   171,   174,   175,   176,   177,   178,   179,   181,   183,
     184,   185,   186,   188,   189,   190,   191,   193,   194,   195,
     196,   198,   199,   200,   202,   203
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NUMBER", "ENGL", "GREEK", "TEXT",
  "PUNCT", "ESCCH", "SOPT", "SEQV", "SLGC", "SOTH", "SSET", "NSET", "NTRI",
  "NHYB", "NEXP", "NOTH", "DIV", "POW", "CHS", "NRT", "SRT", "MOD", "FLR",
  "CIL", "RND", "SWC", "OSUM", "FR", "TO", "WH", "NOVR", "OOVR", "OP",
  "CP", "OS", "CS", "OB", "CB", "OB_M", "OL_M", "CL_M", "SPC", "SEP",
  "SNL", "EOL", "$accept", "list", "sentence", "superelement", "control",
  "subcontrol", "contsingle", "element", "superpiece", "subsuperpiece",
  "supersingle", "reduce", "matrix", "mtx_sentence", "mtx_element",
  "sumational", "sum_symbol", "sum_element", "boundary", "choose", "frac",
  "root", "modular", "round", "over", "bracket", "piece", "subpiece",
  "single", "number", "variable", "name", "symbol", "text", "alignment", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    48,    49,    49,    50,    50,    51,    51,    52,    52,
      53,    53,    54,    54,    55,    55,    55,    55,    55,    55,
      56,    56,    57,    57,    58,    58,    58,    58,    58,    59,
      59,    60,    60,    60,    61,    61,    62,    62,    62,    63,
      63,    64,    65,    65,    65,    66,    66,    67,    68,    69,
      69,    70,    71,    71,    71,    72,    73,    73,    74,    74,
      75,    75,    76,    76,    76,    76,    76,    76,    77,    78,
      78,    78,    78,    79,    79,    79,    79,    80,    80,    80,
      80,    81,    81,    81,    82,    82
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     3,     1,     2,     1,     1,     1,     3,
       1,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     4,     1,     1,     1,     1,     1,     1,
       3,     3,     3,     4,     1,     2,     1,     1,     1,     1,
       2,     1,     1,     1,     2,     4,     2,     3,     3,     2,
       3,     2,     2,     2,     2,     2,     3,     3,     1,     3,
       1,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       2,     0,     1,    68,    69,    70,    81,    82,    83,    77,
      13,    79,    78,    80,    71,    73,    74,    75,    76,     0,
       0,     0,     0,     0,     0,    41,    72,     0,     0,     0,
       0,     0,    84,    12,    85,     0,     4,     7,     8,    10,
       6,    15,    20,    22,     0,    24,    16,    39,    26,    17,
      18,    19,    27,    28,    25,    14,    58,    60,    62,    63,
      64,    65,    66,    67,     0,    49,    29,    51,    52,    53,
      54,     0,    55,     0,     0,    38,    37,    36,     0,    34,
       0,     3,     5,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    43,    40,    42,     0,     0,     0,     0,    56,
      57,    31,    35,    32,     9,     0,    21,     0,    48,    47,
      50,     0,    46,    44,    59,     0,    30,    33,    11,    23,
       0,    61,    45
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     1,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    78,    79,    46,    47,    93,    94,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -65
static const yytype_int16 yypact[] =
{
     -65,   123,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   740,
     740,   740,   740,   740,   -30,   -65,   -65,   740,   652,   652,
     696,   696,   -65,   -65,   -65,   167,   -65,   -65,     2,   -20,
     -65,   -65,    13,   -15,    -1,   -65,   -65,   212,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,     4,    15,   -11,   -65,   -65,
     -65,   -65,   -65,   -65,   652,   -65,   -65,   -65,   -65,   -65,
     -65,   696,   -65,   256,   300,   -65,   -65,   -65,   344,   -65,
     388,   -65,   -65,   740,   652,   740,   652,   740,   740,   740,
     740,   740,   212,   -65,   -65,   740,   652,   432,   476,     8,
     -65,   -65,   -65,   -65,   -65,   520,   -65,   564,   -65,   -65,
     -65,     5,   -65,   -65,   -65,   608,   -65,   -65,   -65,   -65,
     740,   -65,   -65
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -65,   -65,     3,    10,   -65,   -65,   -65,   -24,   -65,   -65,
     -65,   -19,   -65,   -16,   -64,   -65,   -65,   -65,   -55,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -10,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -31
static const yytype_int8 yytable[] =
{
      65,    67,    68,    69,    70,    71,    77,    77,    72,    66,
      66,    66,    66,    66,   102,    80,   102,    66,    87,    84,
      88,    89,    83,   -29,    86,   -29,   -29,   -30,    96,   -30,
     -30,    73,    74,    85,   102,    95,   120,   113,     0,     0,
       0,     0,     0,     0,     0,    82,     0,    77,     0,     0,
      92,     0,     0,     0,    77,    98,    77,     0,     0,     0,
       0,     0,     0,     0,   104,     0,   106,    97,   108,   109,
     110,   111,   112,    66,    77,    66,   114,    66,    66,    66,
      66,    66,     0,    82,    82,    66,     0,   105,     0,   107,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   115,
       0,   122,    82,     0,     0,     0,     0,    82,     0,     0,
      66,     0,     0,     0,     0,    82,     0,    82,     0,     0,
       0,     0,     0,     2,     0,    82,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,     0,     0,     0,     0,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,    26,    27,    28,     0,
      29,     0,     0,     0,    30,    31,     0,    32,    33,    34,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,     0,     0,     0,     0,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
      26,    27,    28,     0,    29,     0,     0,     0,    30,    31,
       0,    32,    33,    34,    81,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,     0,     0,     0,     0,    19,    20,    21,    22,    23,
      24,    25,    90,     0,    91,    26,    27,    28,     0,    29,
       0,     0,     0,    30,    31,     0,    32,    33,    34,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,     0,     0,     0,     0,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,    26,
      27,    28,    99,    29,     0,     0,     0,    30,    31,     0,
      32,    33,    34,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,     0,
       0,     0,     0,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,    26,    27,    28,     0,    29,   100,     0,
       0,    30,    31,     0,    32,    33,    34,     3,     4,     5,
       6,     7,     8,     9,    75,    11,    12,    13,    14,    15,
      16,    17,    18,     0,     0,     0,     0,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,    26,    27,    28,
       0,    29,     0,     0,   101,    30,    31,     0,    32,    76,
      34,     3,     4,     5,     6,     7,     8,     9,    75,    11,
      12,    13,    14,    15,    16,    17,    18,     0,     0,     0,
       0,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,    26,    27,    28,     0,    29,     0,     0,     0,    30,
      31,   103,    32,    76,    34,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,     0,     0,     0,     0,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,    26,    27,    28,   116,    29,
       0,     0,     0,    30,    31,     0,    32,    33,    34,     3,
       4,     5,     6,     7,     8,     9,    75,    11,    12,    13,
      14,    15,    16,    17,    18,     0,     0,     0,     0,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,    26,
      27,    28,   117,    29,     0,     0,     0,    30,    31,     0,
      32,    76,    34,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,     0,
       0,     0,     0,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,    26,    27,    28,     0,    29,     0,     0,
     118,    30,    31,     0,    32,    33,    34,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,     0,     0,     0,     0,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,    26,    27,    28,
       0,    29,     0,     0,   119,    30,    31,     0,    32,    33,
      34,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,     0,     0,     0,
       0,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,    26,    27,    28,     0,    29,     0,     0,   121,    30,
      31,     0,    32,    33,    34,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,     0,     0,     0,     0,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,    26,    27,    28,     0,    29,
       0,     0,     0,    30,    31,     0,    32,    33,    34,     3,
       4,     5,     6,     7,     8,     9,    75,    11,    12,    13,
      14,    15,    16,    17,    18,     0,     0,     0,     0,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,    26,
      27,    28,     0,    29,     0,     0,     0,    30,    31,     0,
      32,    76,    34,     3,     4,     5,     6,     7,     8,     9,
       0,    11,    12,    13,    14,    15,    16,    17,    18,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,    64,     0,     0,     0,     0,
       0,     0,     0,     0,    32,     0,    34
};

static const yytype_int8 yycheck[] =
{
      19,    20,    21,    22,    23,    35,    30,    31,    27,    19,
      20,    21,    22,    23,    78,    31,    80,    27,    19,    39,
      21,    22,    20,    19,    39,    21,    22,    19,    39,    21,
      22,    28,    29,    20,    98,    20,    31,    92,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    35,    -1,    71,    -1,    -1,
      47,    -1,    -1,    -1,    78,    71,    80,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    83,    -1,    85,    64,    87,    88,
      89,    90,    91,    83,    98,    85,    95,    87,    88,    89,
      90,    91,    -1,    73,    74,    95,    -1,    84,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    96,
      -1,   120,    92,    -1,    -1,    -1,    -1,    97,    -1,    -1,
     120,    -1,    -1,    -1,    -1,   105,    -1,   107,    -1,    -1,
      -1,    -1,    -1,     0,    -1,   115,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    -1,    -1,    -1,    -1,    23,    24,    25,    26,
      27,    28,    29,    -1,    -1,    -1,    33,    34,    35,    -1,
      37,    -1,    -1,    -1,    41,    42,    -1,    44,    45,    46,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    -1,    -1,    -1,    -1,
      23,    24,    25,    26,    27,    28,    29,    -1,    -1,    -1,
      33,    34,    35,    -1,    37,    -1,    -1,    -1,    41,    42,
      -1,    44,    45,    46,    47,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    -1,    -1,    -1,    -1,    23,    24,    25,    26,    27,
      28,    29,    30,    -1,    32,    33,    34,    35,    -1,    37,
      -1,    -1,    -1,    41,    42,    -1,    44,    45,    46,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    -1,    -1,    -1,    -1,    23,
      24,    25,    26,    27,    28,    29,    -1,    -1,    -1,    33,
      34,    35,    36,    37,    -1,    -1,    -1,    41,    42,    -1,
      44,    45,    46,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    -1,
      -1,    -1,    -1,    23,    24,    25,    26,    27,    28,    29,
      -1,    -1,    -1,    33,    34,    35,    -1,    37,    38,    -1,
      -1,    41,    42,    -1,    44,    45,    46,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    -1,    -1,    -1,    -1,    23,    24,    25,
      26,    27,    28,    29,    -1,    -1,    -1,    33,    34,    35,
      -1,    37,    -1,    -1,    40,    41,    42,    -1,    44,    45,
      46,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    -1,    -1,    -1,
      -1,    23,    24,    25,    26,    27,    28,    29,    -1,    -1,
      -1,    33,    34,    35,    -1,    37,    -1,    -1,    -1,    41,
      42,    43,    44,    45,    46,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    -1,    -1,    -1,    -1,    23,    24,    25,    26,    27,
      28,    29,    -1,    -1,    -1,    33,    34,    35,    36,    37,
      -1,    -1,    -1,    41,    42,    -1,    44,    45,    46,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    -1,    -1,    -1,    -1,    23,
      24,    25,    26,    27,    28,    29,    -1,    -1,    -1,    33,
      34,    35,    36,    37,    -1,    -1,    -1,    41,    42,    -1,
      44,    45,    46,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    -1,
      -1,    -1,    -1,    23,    24,    25,    26,    27,    28,    29,
      -1,    -1,    -1,    33,    34,    35,    -1,    37,    -1,    -1,
      40,    41,    42,    -1,    44,    45,    46,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    -1,    -1,    -1,    -1,    23,    24,    25,
      26,    27,    28,    29,    -1,    -1,    -1,    33,    34,    35,
      -1,    37,    -1,    -1,    40,    41,    42,    -1,    44,    45,
      46,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    -1,    -1,    -1,
      -1,    23,    24,    25,    26,    27,    28,    29,    -1,    -1,
      -1,    33,    34,    35,    -1,    37,    -1,    -1,    40,    41,
      42,    -1,    44,    45,    46,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    -1,    -1,    -1,    -1,    23,    24,    25,    26,    27,
      28,    29,    -1,    -1,    -1,    33,    34,    35,    -1,    37,
      -1,    -1,    -1,    41,    42,    -1,    44,    45,    46,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    -1,    -1,    -1,    -1,    23,
      24,    25,    26,    27,    28,    29,    -1,    -1,    -1,    33,
      34,    35,    -1,    37,    -1,    -1,    -1,    41,    42,    -1,
      44,    45,    46,     3,     4,     5,     6,     7,     8,     9,
      -1,    11,    12,    13,    14,    15,    16,    17,    18,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    33,    -1,    35,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    44,    -1,    46
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    49,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    23,
      24,    25,    26,    27,    28,    29,    33,    34,    35,    37,
      41,    42,    44,    45,    46,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    63,    64,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    35,    59,    74,    59,    59,    59,
      59,    35,    59,    50,    50,    10,    45,    55,    61,    62,
      61,    47,    51,    20,    39,    20,    39,    19,    21,    22,
      30,    32,    50,    65,    66,    20,    39,    50,    61,    36,
      38,    40,    62,    43,    59,    50,    59,    50,    59,    59,
      59,    59,    59,    66,    59,    50,    36,    36,    40,    40,
      31,    40,    59
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 3:

/* Line 1455 of yacc.c  */
#line 75 "math.y"
    { pop(ts[0]); strcat(latex, ts[0]); strcat(latex, " \n"); dbs(); ;}
    break;

  case 5:

/* Line 1455 of yacc.c  */
#line 79 "math.y"
    { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); ;}
    break;

  case 9:

/* Line 1455 of yacc.c  */
#line 86 "math.y"
    { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 11:

/* Line 1455 of yacc.c  */
#line 89 "math.y"
    { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 12:

/* Line 1455 of yacc.c  */
#line 91 "math.y"
    { push(","); ;}
    break;

  case 13:

/* Line 1455 of yacc.c  */
#line 92 "math.y"
    { join(2, "&", dSeqv[(yyvsp[(1) - (1)])]); push(ts[0]); dbs(); ;}
    break;

  case 21:

/* Line 1455 of yacc.c  */
#line 103 "math.y"
    { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 23:

/* Line 1455 of yacc.c  */
#line 106 "math.y"
    { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 31:

/* Line 1455 of yacc.c  */
#line 119 "math.y"
    { popi(1); join(3, "\\begin{bmatrix}\n", ts[1], "\n\\end{bmatrix}"), push(ts[0]); dbs(); ;}
    break;

  case 32:

/* Line 1455 of yacc.c  */
#line 120 "math.y"
    { popi(1); join(3, "\\begin{vmatrix}\n", ts[1], "\n\\end{vmatrix}"), push(ts[0]); dbs(); ;}
    break;

  case 33:

/* Line 1455 of yacc.c  */
#line 121 "math.y"
    { popi(1); join(3, "\\begin{cases}\n", ts[1], "\n\\end{cases}"), push(ts[0]); dbs(); ;}
    break;

  case 35:

/* Line 1455 of yacc.c  */
#line 124 "math.y"
    { popi(2); join(2, ts[2], ts[1]); push(ts[0]); dbs(); ;}
    break;

  case 37:

/* Line 1455 of yacc.c  */
#line 127 "math.y"
    { push("&"); ;}
    break;

  case 38:

/* Line 1455 of yacc.c  */
#line 128 "math.y"
    { push(dSeqv[(yyvsp[(1) - (1)])]); ;}
    break;

  case 40:

/* Line 1455 of yacc.c  */
#line 132 "math.y"
    { popi(2); if((yyvsp[(1) - (2)])<7) join(2, ts[2], ts[1]); else join(3, ts[2], "\\limits", ts[1]); push(ts[0]); dbs(); ;}
    break;

  case 41:

/* Line 1455 of yacc.c  */
#line 134 "math.y"
    { push(dOsum[(yyvsp[(1) - (1)])]); ;}
    break;

  case 44:

/* Line 1455 of yacc.c  */
#line 138 "math.y"
    { popi(2); join(2, ts[1], ts[2]); push(ts[0]), dbs(); ;}
    break;

  case 45:

/* Line 1455 of yacc.c  */
#line 140 "math.y"
    { popi(2), join(5, "_{", ts[2], "}^{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 46:

/* Line 1455 of yacc.c  */
#line 141 "math.y"
    { popi(1), join(3, "_{\\substack{", ts[1], "}}"); push(ts[0]); dbs(); ;}
    break;

  case 47:

/* Line 1455 of yacc.c  */
#line 144 "math.y"
    { popi(2); join(5, "{", ts[2], "\\choose", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 48:

/* Line 1455 of yacc.c  */
#line 146 "math.y"
    { popi(2); join(5, "\\frac{", ts[2], "}{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 49:

/* Line 1455 of yacc.c  */
#line 148 "math.y"
    { popi(1); join(3, "\\sqrt{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 50:

/* Line 1455 of yacc.c  */
#line 149 "math.y"
    { popi(2); join(5, "\\sqrt[", ts[2], "]{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 51:

/* Line 1455 of yacc.c  */
#line 151 "math.y"
    { popi(1); join(3, "\\pmod{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 52:

/* Line 1455 of yacc.c  */
#line 153 "math.y"
    { popi(1); join(3, "\\lfloor", ts[1], "\\rfloor"); push(ts[0]); dbs(); ;}
    break;

  case 53:

/* Line 1455 of yacc.c  */
#line 154 "math.y"
    { popi(1); join(3, "\\lceil", ts[1], "\\lceil"); push(ts[0]); dbs(); ;}
    break;

  case 54:

/* Line 1455 of yacc.c  */
#line 155 "math.y"
    { popi(1); join(3, "\\lfloor", ts[1], "\\lceil"); push(ts[0]); dbs(); ;}
    break;

  case 55:

/* Line 1455 of yacc.c  */
#line 157 "math.y"
    { popi(1); join(4, dOovr[(yyvsp[(1) - (2)])], "{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 56:

/* Line 1455 of yacc.c  */
#line 160 "math.y"
    { popi(1); join(3, "\\left(", ts[1], "\\right)"); push(ts[0]); dbs(); ;}
    break;

  case 57:

/* Line 1455 of yacc.c  */
#line 161 "math.y"
    { popi(1); join(3, "\\left\\{", ts[1], "\\right\\}"); push(ts[0]); dbs(); ;}
    break;

  case 59:

/* Line 1455 of yacc.c  */
#line 165 "math.y"
    { popi(2); join(4, ts[2], "^{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 61:

/* Line 1455 of yacc.c  */
#line 171 "math.y"
    { popi(2); join(4, ts[2], "_{", ts[1], "}"); push(ts[0]); dbs(); ;}
    break;

  case 68:

/* Line 1455 of yacc.c  */
#line 181 "math.y"
    { push((char*)(yyvsp[(1) - (1)])); ;}
    break;

  case 69:

/* Line 1455 of yacc.c  */
#line 183 "math.y"
    { join(2, " ", (char*)(yyvsp[(1) - (1)])); push(ts[0]); ;}
    break;

  case 70:

/* Line 1455 of yacc.c  */
#line 184 "math.y"
    { join(2, "\\", (char*)(yyvsp[(1) - (1)])); push(ts[0]); ;}
    break;

  case 71:

/* Line 1455 of yacc.c  */
#line 185 "math.y"
    { push(dNset[(yyvsp[(1) - (1)])]); ;}
    break;

  case 72:

/* Line 1455 of yacc.c  */
#line 186 "math.y"
    { push(dNovr[(yyvsp[(1) - (1)])]); ;}
    break;

  case 73:

/* Line 1455 of yacc.c  */
#line 188 "math.y"
    { push(dNtri[(yyvsp[(1) - (1)])]); ;}
    break;

  case 74:

/* Line 1455 of yacc.c  */
#line 189 "math.y"
    { push(dNhyb[(yyvsp[(1) - (1)])]); ;}
    break;

  case 75:

/* Line 1455 of yacc.c  */
#line 190 "math.y"
    { push(dNexp[(yyvsp[(1) - (1)])]); ;}
    break;

  case 76:

/* Line 1455 of yacc.c  */
#line 191 "math.y"
    { push(dNoth[(yyvsp[(1) - (1)])]); ;}
    break;

  case 77:

/* Line 1455 of yacc.c  */
#line 193 "math.y"
    { push(dSopt[(yyvsp[(1) - (1)])]); ;}
    break;

  case 78:

/* Line 1455 of yacc.c  */
#line 194 "math.y"
    { push(dSoth[(yyvsp[(1) - (1)])]); ;}
    break;

  case 79:

/* Line 1455 of yacc.c  */
#line 195 "math.y"
    { push(dSlgc[(yyvsp[(1) - (1)])]); ;}
    break;

  case 80:

/* Line 1455 of yacc.c  */
#line 196 "math.y"
    { push(dSset[(yyvsp[(1) - (1)])]); ;}
    break;

  case 81:

/* Line 1455 of yacc.c  */
#line 198 "math.y"
    { strcpy(ts[1], (char*)(yyvsp[(1) - (1)])+1); ts[1][strlen(ts[1])-1] = '\0'; join(3, "\\text{", ts[1], "}"); push(ts[0]); ;}
    break;

  case 82:

/* Line 1455 of yacc.c  */
#line 199 "math.y"
    { push((char*)(yyvsp[(1) - (1)])); ;}
    break;

  case 83:

/* Line 1455 of yacc.c  */
#line 200 "math.y"
    { join(2, "\\", (char*)(yyvsp[(1) - (1)])); push(ts[0]); ;}
    break;

  case 84:

/* Line 1455 of yacc.c  */
#line 202 "math.y"
    { push("\\quad"); ;}
    break;

  case 85:

/* Line 1455 of yacc.c  */
#line 203 "math.y"
    { push("\\\\\n"); ;}
    break;



/* Line 1455 of yacc.c  */
#line 2015 "math.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1675 of yacc.c  */
#line 205 "math.y"


main(int argc, char **argv) {
  yyparse();
  strcat(latex, "\\end{align}");
  printf("%s\n", latex);
}

yyerror(char *s) {
  fprintf(stderr, "error: %s\n", s);
}
