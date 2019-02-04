%{
/* This is a simple scanner reporting the output into a file */
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
{any}		{printf("Invalid Input\n");}
%%

int main()
{
	
	strncpy(output,"This is the output:\n",sizeof(output));
	yylex();
	FILE *fp;
	fp = fopen("out.txt","w");
	fprintf(fp,output,sizeof(output));
	fclose(fp);
	return 0;
}
