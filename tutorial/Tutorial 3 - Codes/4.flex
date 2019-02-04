%{
/* This is a simple scanner with function yyterminate() */
#include <stdio.h>
char output[100];
%}

digit	[0-9]
letter	[a-zA-Z]
pattern	{letter}+{digit}*

%%
{pattern}	{printf("pattern found: %s\n",yytext);
		 strcat(output,yytext);
		 strcat(output,"\n");}
<<EOF>>		{yyterminate();}

%%

int main()
{
	FILE *input;
	input = fopen("in.txt","r");
	yyin = input;
	yylex();
	fclose(input);
	printf("\n\nThis is output:\n%s\n",output);
	return 0;
}
