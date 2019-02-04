%{
/* This is a simple scanner with function yyterminate() */
#include <stdio.h>
char output[100];
%}


digit	[0-9]
letter	[a-zA-Z]
pattern	{letter}+{digit}*\n
newline \n
any	.*\n

%%
{pattern}	{printf("pattern found: %s\n",yytext);
		 strcat(output,yytext);
		 strcat(output,"\n");}
{newline}	{printf("NEW LINE!\n");}
{any}		{printf("Invalid Input\n"); yyterminate();}

%%

int main()
{
	
	yylex();
	printf("\n\nThis is output:\n%s\n",output);
	return 0;
}
