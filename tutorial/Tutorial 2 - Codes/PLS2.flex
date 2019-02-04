%{
/* This is a simple scanner to demonstrate the principle of longest substring */
#include <stdio.h>
%}


A	a
B	b
AB	ab

%%

{A}	{printf("This is character a.\n");}
{B}	{printf("This is character b.\n");}
{AB}	{printf("ab - The principle of longest substring!");}
%%

int main()
{
	yylex();
	return 0;
}
