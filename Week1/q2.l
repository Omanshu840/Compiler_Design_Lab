%{#include<stdio.h>
int Identifiers = 0;
int Keywords = 0;
int Operators = 0;
int lineNumber = 1;
%}
digit[0-9]
letter[a-zA-Z_]

%%
"\n" {
lineNumber++;
}
"int"|"for"|"return" {
Keywords++;
printf("Keyword: %s line no. %d\n", yytext, lineNumber);
}

{letter}({letter}|{digit})* {
Identifiers++;
printf("Identifier: %s line no. %d\n", yytext, lineNumber);
}

"<="|"=="|"="|"++"|"-"|"*"|"+" {
Operators++;
printf("Operator: %s line no. %d\n", yytext, lineNumber);
}

. ;

%%

int yywrap(){}

int main()
{
    yyin=fopen("input_copied.c","r");
	yylex();
	printf("Count of identifiers: %d\n", Identifiers);
	printf("Count of keywords: %d\n", Keywords);
	printf("Count of operators: %d\n", Operators);
	return 0;
}