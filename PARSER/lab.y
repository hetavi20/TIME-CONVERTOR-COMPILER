%{
	#include<stdio.h>
%}

%token NUM
%token UNITM
%token UNITS
%token UNITH
%token UNITMS
%token KEYQUE
%token Q

%% 
ADI: A{
printf("Answer is: %d \n",$$);
return 0; };
|B{
printf("Answer is: %f",(float)$$/60);
return 0;
};
|C{
printf("Answer is: %f",(float)$$/1000);
return 0;
};


A: NUM' 'UNITH' 'KEYQUE' 'KEYQUE' 'UNITM' 'Q {$$=($1*60);}
  |NUM' 'UNITH' 'KEYQUE' 'UNITM' 'KEYQUE' 'Q {$$=($1*60);}
  |NUM' 'UNITH' 'KEYQUE' 'KEYQUE' 'UNITS' 'Q {$$=($1*60*60);}
  |NUM' 'UNITH' 'KEYQUE' 'UNITS' 'KEYQUE' 'Q {$$=($1*60*60);}
  |NUM' 'UNITH' 'KEYQUE' 'KEYQUE' 'UNITMS' 'Q {$$=($1*60*60*1000);}
  |NUM' 'UNITH' 'KEYQUE' 'UNITMS' 'KEYQUE' 'Q {$$=($1*60*60*1000);}
  |NUM' 'UNITM' 'KEYQUE' 'KEYQUE' 'UNITS' 'Q {$$=($1*60);}
  |NUM' 'UNITM' 'KEYQUE' 'UNITS' 'KEYQUE' 'Q {$$=($1*60);}
  |NUM' 'UNITM' 'KEYQUE' 'KEYQUE' 'UNITMS' 'Q {$$=($1*60*1000);}
  |NUM' 'UNITM' 'KEYQUE' 'UNITMS' 'KEYQUE' 'Q {$$=($1*60*1000);}
  |NUM' 'UNITS' 'KEYQUE' 'KEYQUE' 'UNITMS' 'Q {$$=($1*1000);}
  |NUM' 'UNITS' 'KEYQUE' 'UNITMS' 'KEYQUE' 'Q {$$=($1*1000);}
;
B: NUM' 'UNITM' 'KEYQUE' 'KEYQUE' 'UNITH' 'Q {$$=$1;}
  |NUM' 'UNITM' 'KEYQUE' 'UNITH' 'KEYQUE' 'Q {$$=$1;}
  |NUM' 'UNITS' 'KEYQUE' 'KEYQUE' 'UNITH' 'Q {$$=(float)$1/60;}
  |NUM' 'UNITS' 'KEYQUE' 'UNITH' 'KEYQUE' 'Q {$$=(float)$1/60;}
  |NUM' 'UNITS' 'KEYQUE' 'KEYQUE' 'UNITM' 'Q {$$=$1;}
  |NUM' 'UNITS' 'KEYQUE' 'UNITM' 'KEYQUE' 'Q {$$=$1;}
  
  ;

C: NUM' 'UNITMS' 'KEYQUE' 'KEYQUE' 'UNITS' 'Q {$$=$1;}
  |NUM' 'UNITMS' 'KEYQUE' 'UNITS' 'KEYQUE' 'Q {$$=$1;}
  |NUM' 'UNITMS' 'KEYQUE' 'KEYQUE' 'UNITH' 'Q {$$=(float)$1/3600;}
  |NUM' 'UNITMS' 'KEYQUE' 'UNITH' 'KEYQUE' 'Q {$$=(float)$1/3600;}
  |NUM' 'UNITMS' 'KEYQUE' 'KEYQUE' 'UNITM' 'Q {$$=(float)$1/60;}
  |NUM' 'UNITMS' 'KEYQUE' 'UNITM' 'KEYQUE' 'Q {$$=(float)$1/60;}
;
%%
void main(){
	printf("valid string\n");
	yyparse();
}
void yyerror(){printf("Please enter valid value. \n");}
