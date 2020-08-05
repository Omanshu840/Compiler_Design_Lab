/*Definition Section*/
%{
#include<stdio.h>
%}


/*Rule Section*/

%%
[ \t]+ {};

\/\/(.*) {};					

\/\*(.*\n)*.*\*\/  {};			
%%

/*call the yywrap function*/
int yywrap()
{
    return 1;
}



/*Auxiliary function*/
/*Driver function*/

int main()
{
    yyin=fopen("input.c","r");
    yyout=fopen("input_copied.c","w");

    yylex();
    return 0;
}
