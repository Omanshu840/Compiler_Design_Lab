%{
   #include<stdio.h>
   #include<stdlib.h>
   int yylex();
%}

%token A B C NL

%%
stmt: S NL  { printf("valid string\n");
              exit(0); }
;
S: W | X Y
;
X: A X B |
;
Y: C Y |
;
W: A W C | Z
;
Z: B Z |
;
%%

int yyerror(char *msg)
 {
  printf("invalid string\n");
  exit(0);
 }


main()
 {
  printf("enter the string\n");
  yyparse();
 }