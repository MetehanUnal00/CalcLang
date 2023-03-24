# Programming Language CalcLang
Group Members: 

20190808022 - Metehan Ünal

20190808059 - Utkan Ulaş Yurttaş


## Syntax

\<program\> ::= \<statement\>+

\<statement\> ::= \<assignment\> | \<expression\> | \<function\>

\<assignment\> ::= \<identifier\> "=" \<expression\> ";"

\<expression\> ::= \<term\> | \<expression\> "+" \<term\> | \<expression\> "-" \<term\>

\<term\> ::= \<factor\> | \<term\> "*" \<factor\> | \<term\> "/" <factor\>

\<factor\> ::= \<number\> | \<identifier\> | "(" \<expression\> ")" | \<function\>

\<function\> ::= \<function_name\> "(" \<expression\> ")"

\<function_name\> ::= "sin" | "cos" | "tan" | "sqrt" | "log" | "exp"

\<number\> ::= \<integer\> | \<float\>

\<integer\> ::= \<digit\>+

\<float\> ::= \<digit\>+ "." \<digit\>+

\<identifier\> ::= \<letter\> (\<letter\> | \<digit\>)*

\<letter\> ::= "A" | "B" | ... | "Z" | "a" | "b" | ... | "z"

\<digit\> ::= "0" | "1" | ... | "9"

## Explanations about the language
Design:
MathLang is a programming language designed specifically for mathematical computations. The language supports all basic mathematical operations, as well as advanced mathematical functions.

- Mathematical operations (+, -, *, /)
- Advanced mathematical functions (sin, cos, tan, sqrt, log, exp)
- Assignment of values to variables
- Basic variable types (numbers)
- Parentheses for grouping expressions
- Semicolon to end statements

- You can run your program by running the makefile and running this command:

make run-example
