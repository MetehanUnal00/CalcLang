%{
#include <stdio.h>
#include <math.h>
#include "calcLang.tab.h"

extern int yylex();
extern int yyerror(const char* msg);

double compute_abs(double value) {
    return fabs(value);
}

double compute_sin(double value) {
    return sin(value);
}

double compute_cos(double value) {
    return cos(value);
}

double compute_tan(double value) {
    return tan(value);
}

double compute_sqrt(double value) {
    return sqrt(value);
}

double compute_log(double value) {
    return log(value);
}

double compute_exp(double value) {
    return exp(value);
}

double compute_ceil(double value) {
    return ceil(value);
}

double compute_floor(double value) {
    return floor(value);
}

double compute_min(double value1, double value2) {
    return fmin(value1, value2);
}

double compute_max(double value1, double value2) {
    return fmax(value1, value2);
}

double compute_derivative(double (*func)(double), double x, double h) {
    return (func(x + h) - func(x - h)) / (2.0 * h);
}

double compute_integral(double (*func)(double), double a, double b, int n) {
    double h = (b - a) / n;
    double sum = 0.0;
    double x;
    int i;

    for (i = 0; i < n; i++) {
        x = a + (i + 0.5) * h;
        sum += func(x);
    }

    return h * sum;
}

%}

%union {
    double value;
}

%token <value> INTEGER
%token <value> FLOAT
%token <value> IDENTIFIER
%token PLUS MINUS MULTIPLY DIVIDE MODULO
%token ASSIGN EQUAL NOTEQUAL LESS LESSEQUAL GREATER GREATEREQUAL
%token AND OR NOT
%token LPAREN RPAREN LBRACKET RBRACKET LBRACE RBRACE COMMA SEMICOLON QUOTE
%token IF ELSE WHILE FOR BREAK CONTINUE RETURN PRINT PRINTLN TRUE FALSE NULL
%token PI E
%token ABS SIN COS TAN SQRT LOG EXP CEIL FLOOR MIN MAX DERIVATIVE INTEGRAL

%left PLUS MINUS
%left MULTIPLY DIVIDE MODULO
%nonassoc UMINUS

%type <value> expression

%start program

%%

program: /* empty */
       | program statement
       ;

statement: expression '\n' { printf("Result: %.2f\n", $1); }
         ;

expression: INTEGER         { $$ = $1; }
          | FLOAT           { $$ = $1; }
          | IDENTIFIER      { $$ = $1; }
          | expression PLUS expression      { $$ = $1 + $3; }
          | expression MINUS expression     { $$ = $1 - $3; }
          | expression MULTIPLY expression  { $$ = $1 * $3; }
          | expression DIVIDE expression    { $$ = $1 / $3; }
          | expression MODULO expression    { $$ = fmod($1, $3); }
          
          | expression ASSIGN expression {
                const char* variable = $1;
                double value = $3;
                printf("ASSIGN %s = %lf\n", variable, value);

                $$ = value;
            }

          | expression EQUAL expression     { $$ = ($1 == $3) ? 1.0 : 0.0; }
          | expression NOTEQUAL expression  { $$ = ($1 != $3) ? 1.0 : 0.0; }
          | expression LESS expression      { $$ = ($1 < $3) ? 1.0 : 0.0; }
          | expression LESSEQUAL expression { $$ = ($1 <= $3) ? 1.0 : 0.0; }
          | expression GREATER expression   { $$ = ($1 > $3) ? 1.0 : 0.0; }
          | expression GREATEREQUAL expression  { $$ = ($1 >= $3) ? 1.0 : 0.0; }
          | expression AND expression       { $$ = ($1 && $3) ? 1.0 : 0.0; }
          | expression OR expression        { $$ = ($1 || $3) ? 1.0 : 0.0; }
          | NOT expression                 { $$ = ($2 == 0.0) ? 1.0 : 0.0; }
          | LPAREN expression RPAREN       { $$ = $2; }
          | ABS LPAREN expression RPAREN   { $$ = compute_abs($3); }
          | SIN LPAREN expression RPAREN   { $$ = compute_sin($3); }
          | COS LPAREN expression RPAREN   { $$ = compute_cos($3); }
          | TAN LPAREN expression RPAREN   { $$ = compute_tan($3); }
          | SQRT LPAREN expression RPAREN  { $$ = compute_sqrt($3); }
          | LOG LPAREN expression RPAREN   { $$ = compute_log($3); }
          | EXP LPAREN expression RPAREN   { $$ = compute_exp($3); }
          | CEIL LPAREN expression RPAREN  { $$ = compute_ceil($3); }
          | FLOOR LPAREN expression RPAREN { $$ = compute_floor($3); }
          | MIN LPAREN expression COMMA expression RPAREN   { $$ = compute_min($3, $5); }
          | MAX LPAREN expression COMMA expression RPAREN   { $$ = compute_max($3, $5); }
          | DERIVATIVE LPAREN IDENTIFIER COMMA expression COMMA expression RPAREN  { $$ = compute_derivative($3, $5, $7); }
          | INTEGRAL LPAREN IDENTIFIER COMMA expression COMMA expression COMMA INTEGER RPAREN { $$ = compute_integral($3, $5, $7, $9); }

          | IF LPAREN expression RPAREN LBRACE program RBRACE ELSE LBRACE program RBRACE {
                if ($3) {
                    $$ = $6;
                }
                else {
                    $$ = $10;
                }
            }

          | WHILE LPAREN expression RPAREN LBRACE program RBRACE {
            while ($3) {
                $6;
            }
            $$ = NULL;
        }
          | FOR LPAREN expression SEMICOLON expression SEMICOLON expression RPAREN LBRACE program RBRACE {
    for ($3; $5; $7) {
        $10;
    }
    $$ = NULL;
}
          | BREAK SEMICOLON {
    $$ = NULL;
}
          | CONTINUE SEMICOLON {
    $$ = NULL;
}
          | RETURN expression SEMICOLON {
    $$ = $2;
}
          | PRINT LPAREN expression RPAREN SEMICOLON {
    printf("%lf\n", $3);
    $$ = NULL;
}
          | PRINTLN LPAREN expression RPAREN SEMICOLON {
    printf("%lf\n", $3);
    $$ = NULL;
}

          | TRUE             { $$ = 1.0; }
          | FALSE            { $$ = 0.0; }
          | NULL             { $$ = 0.0; }
          | PI               { $$ = 3.141592653589793; }
          | E                { $$ = 2.718281828459045; }
          ;

%%

int main(int argc, char* argv[]) {
    FILE* file = fopen(argv[1], "r");
    if (!file) {
        printf("File not found.\n");
        return 1;
    }
    yyin = file;
    yyparse();
    fclose(file);
    return 0;
}

int yyerror(const char* msg) {
    printf("Error: %s\n", msg);
    return 0;
}

