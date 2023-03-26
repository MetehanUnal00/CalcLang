%{
#include <stdio.h>
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

{INTEGER}       { printf("INTEGER %s\n", yytext); }
{FLOAT}         { printf("FLOAT %s\n", yytext); }

{ID}            { printf("IDENTIFIER %s\n", yytext); }

"+"             { printf("PLUS\n"); }
"-"             { printf("MINUS\n"); }
"*"             { printf("MULTIPLY\n"); }
"/"             { printf("DIVIDE\n"); }
"%"             { printf("MODULO\n"); }
"="             { printf("ASSIGN\n"); }
"=="            { printf("EQUAL\n"); }
"!="            { printf("NOTEQUAL\n"); }
"<"             { printf("LESS\n"); }
"<="            { printf("LESSEQUAL\n"); }
">"             { printf("GREATER\n"); }
">="            { printf("GREATEREQUAL\n"); }
"&&"            { printf("AND\n"); }
"\|\|"          { printf("OR\n"); }
"!"             { printf("NOT\n"); }
"("             { printf("LPAREN\n"); }
")"             { printf("RPAREN\n"); }
"["             { printf("LBRACKET\n"); }
"]"             { printf("RBRACKET\n"); }
"{"             { printf("LBRACE\n"); }
"}"             { printf("RBRACE\n"); }
","             { printf("COMMA\n"); }
";"             { printf("SEMICOLON\n"); }
"\""            { printf("QUOTE\n"); }

"if"            { printf("IF\n"); }
"else"          { printf("ELSE\n"); }
"while"         { printf("WHILE\n"); }
"for"           { printf("FOR\n"); }
"break"         { printf("BREAK\n"); }
"continue"      { printf("CONTINUE\n"); }
"return"        { printf("RETURN\n"); }
"print"         { printf("PRINT\n"); }
"println"       { printf("PRINTLN\n"); }
"true"          { printf("TRUE\n"); }
"false"         { printf("FALSE\n"); }
"null"          { printf("NULL\n"); }

"pi"            { printf("PI\n"); }
"e"             { printf("E\n"); }

"abs"           { printf("ABS\n"); }
"sin"           { printf("SIN\n"); }
"cos"           { printf("COS\n"); }
"tan"           { printf("TAN\n"); }
"sqrt"          { printf("SQRT\n"); }
"log"           { printf("LOG\n"); }
"exp"           { printf("EXP\n"); }
"ceil"          { printf("CEIL\n"); }
"floor"         { printf("FLOOR\n"); }
"min"           { printf("MIN\n"); }
"max"           { printf("MAX\n"); }
"derivative"    { printf("DERIVATIVE\n"); }
"integral"      { printf("INTEGRAL\n"); }


%%

int main(int argc, char* argv[]) {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}