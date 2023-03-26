# Programming Language CalcLang
Group Members: 

20190808022 - Metehan Ünal

20190808059 - Utkan Ulaş Yurttaş


## Syntax

\<program\> ::= \<statement\>+

\<statements\> ::= \<statement\> | \<statement\> \<statements\>

\<statement\> ::= \<assignment\> | \<expression\> | \<function\>| \<if-statement\> | \<while-loop\> | \<io-statement\>

\<assignment\> ::= \<identifier\> "=" \<expression\> ";"

\<expression\> ::= \<term\> | \<expression\> "+" \<term\> | \<expression\> "-" \<term\>

\<term\> ::= \<factor\> | \<term\> "*" \<factor\> | \<term\> "/" <factor\>

\<factor\> ::= \<number\> | \<identifier\> | "(" \<expression\> ")" | \<function\>

\<function\> ::= \<function_name\> "(" \<expression\> ")"

\<function_name\> ::= "abs" | "sin" | "cos" | "tan" | "sqrt" | "log" | "exp" | "ceil" | "floor" | "min" | "max" | "derivative" | "integral"

\<number\> ::= \<integer\> | \<float\>

\<integer\> ::= \<digit\>+

\<float\> ::= \<digit\>+ "." \<digit\>+

\<identifier\> ::= \<letter\> (\<letter\> | \<digit\>)*

\<letter\> ::= "A" | "B" | ... | "Z" | "a" | "b" | ... | "z"

\<digit\> ::= "0" | "1" | ... | "9"

\<constant\> ::= "pi" | "e"

\<if-statement\> ::= "if" "(" \<expression\> ")" "{" \<statements\> "}" ["else" "{" \<statements\> "}"]

\<while-loop\> ::= "while" "(" \<expression\> ")" "{" \<statements\> "}"

\<io-statement\> ::= "print" "(" \<expression\> ")" | "input" "(" \<identifier\> ")"

## Explanations about the language
Design:
CalcLang is a programming language designed specifically for mathematical computations. The language supports all basic mathematical operations, as well as advanced mathematical functions.

The language also supports basic variable types such as numbers, and allows for the assignment of values to variables. Expressions can be grouped using parentheses, and statements must be terminated with a semicolon.

CalcLang provides control structures such as if statements and while loops for more complex computations. Additionally, input/output statements are provided to allow users to interact with their programs.

- Mathematical operations (+, -, *, /)
- Advanced mathematical functions (sin, cos, tan, sqrt, log, exp, abs, ceil, floor, min, max, derivative, integral)
- Constants (e, pi)
- Assignment of values to variables
- Basic variable types (numbers)
- Parentheses for grouping expressions
- Semicolon to end statements
- Conditional statements (if-else)
- Looping statements (while-loop)
- Input/output statements (io-statement)

- You can run your program by running the makefile and running this command:

make run-example
