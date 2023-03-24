%{
#include <stdio.h>
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT})*
INTEGER     {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+
WS          [ \t\n]+

%%

{WS}            /* ignore whitespace */

{INTEGER}       { printf("INTEGER %s\n", yytext); }
{FLOAT}         { printf("FLOAT %s\n", yytext); }

{ID}            { printf("IDENTIFIER %s\n", yytext); }

"+"             { printf("PLUS\n"); }
"-"             { printf("MINUS\n"); }
"*"             { printf("MULTIPLY\n"); }
"/"             { printf("DIVIDE\n"); }
"="             { printf("ASSIGN\n"); }
"("             { printf("LPAREN\n"); }
")"             { printf("RPAREN\n"); }
";"             { printf("SEMICOLON\n"); }

"sin"           { printf("SIN\n"); }
"cos"           { printf("COS\n"); }
"tan"           { printf("TAN\n"); }
"sqrt"          { printf("SQRT\n"); }
"log"           { printf("LOG\n"); }
"exp"           { printf("EXP\n"); }

%%

int main(int argc, char* argv[]) {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}