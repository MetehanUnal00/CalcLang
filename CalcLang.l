%{
#include <stdio.h>
#include "CalcLang.tab.h"
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT})*
INTEGER     {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+
WS          [ \t\n]+
COM    \/\*([^*]|\*+[^*\/])*\*+\/

%%
{WS}            /* ignore whitespace */
{COM}           /* ignore comments */

{INTEGER}       { yylval.val = atof(yytext); return INTEGER; }
{FLOAT}         { yylval.val = atof(yytext); return FLOAT; }


"if"            { return IF; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"for"           { return FOR; }
"break"         { return BREAK; }
"continue"      { return CONTINUE; }
"return"        { return RETURN; }
"print"         { return PRINT; }
"println"       { return PRINTLN; }
"true"          { return TRUE; }
"false"         { return FALSE; }
"null"          { return NULL; }

"pi"            { yylval.val = 3.14159; return PI; }
"e"             { yylval.val = 2.71828; return E; }

"abs"           { return ABS; }
"sin"           { return SIN; }
"cos"           { return COS; }
"tan"           { return TAN; }
"sqrt"          { return SQRT; }
"log"           { return LOG; }
"exp"           { return EXP; }
"ceil"          { return CEIL; }
"floor"         { return FLOOR; }
"min"           { return MIN; }
"max"           { return MAX; }
"derivative"    { return DERIVATIVE; }
"integral"      { return INTEGRAL; }

{ID}            { yylval.identifier = strdup(yytext); return IDENTIFIER; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULTIPLY; }
"/"             { return DIVIDE; }
"%"             { return MODULO; }
"="             { return ASSIGN; }
"=="            { return EQUAL; }
"!="            { return NOTEQUAL; }
"<"             { return LESS; }
"<="            { return LESSEQUAL; }
">"             { return GREATER; }
">="            { return GREATEREQUAL; }
"&&"            { return AND; }
"\|\|"          { return OR; }
"!"             { return NOT; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"["             { return LBRACKET; }
"]"             { return RBRACKET; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
","             { return COMMA; }
";"             { return SEMICOLON; }
"\""            { return QUOTE; }

%%