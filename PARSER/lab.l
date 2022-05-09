%{
	#include<stdio.h>
	#include "lab.tab.h"
	extern int yylval;
%}

%%
[0-9]+ {yylval=atoi(yytext);  printf("%s : number\n",yytext);
return NUM; } 
"na"|"atle"|"ketla"   printf("%s : keyword\n",yytext);   return KEYQUE;
"minute" printf("%s : opratore\n",yytext);  return UNITM;
"second" printf("%s : opratore\n",yytext);  return UNITS;
"hour" printf("%s : opratore\n",yytext);  return UNITH;
"milisecond" printf("%s : opratore\n",yytext);  return UNITMS;
"?" printf("%s : question mark\n",yytext); return Q;
[\t] ; 
[\n] return 0;
. return yytext[0];
%%
int yywrap() 
{
return 1;
}
