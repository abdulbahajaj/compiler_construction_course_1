%{
/* This is a simple scanner reporting an output string in the main function */
#include <stdio.h>
char output[100];
%}


digit	[0-9]
letter	[a-zA-Z]
pattern	{letter}+{digit}*
any	.*

%%
{pattern}	{printf("pattern found: %s\n",yytext);
		 strcat(output,yytext);
		 strcat(output,"\n");}
{any}		{printf("No email found.\n");}
%%

int main()
{
	
	strncpy(output,"This is the output:\n",sizeof(output));
	yylex();
	printf("this is in the main:\n%s\n",output);
	return 0;
}
