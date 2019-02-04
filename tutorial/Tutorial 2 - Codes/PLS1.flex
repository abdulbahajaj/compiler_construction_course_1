%{
/* This is a simple scanner to demonstrate the principle of longest substring */
#include <stdio.h>
%}


A	a
B	b

%%

{A}	{printf("This is character a.\n");}
{B}	{printf("This is character b.\n");}

%%

int main()
{
	yylex();
	return 0;
}
