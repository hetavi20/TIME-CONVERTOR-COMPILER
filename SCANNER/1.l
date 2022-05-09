%{
#include<stdio.h>
%}
Keyword "ketla"|"atle"|"na"
Op "second"|"minute"|"hour"|"milisecond"
Digit [0-9]
Int {Digit}+
qm "?"
ws " "

%%
{Keyword} {printf("Keyword - %s\n",yytext);}
{Op} {printf("Operator - %s\n",yytext);}
{Int} {printf("Integer - %s\n",yytext);}

{qm} {printf("que tag - %s\n",yytext);}
{ws} {printf("ws \n",yytext);}
. {printf("%s is not a valid token\n",yytext);}

%%
int yywrap(){return 1;}
int main()
{
yylex();
return 0;
}

