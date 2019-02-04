%{
/* 
This is a simple scanner for understanding how to catch special symbols like \n.
It also demonstrate howto use The Principle of Longest Substring.
*/
#include <stdio.h>
%}

newline		\n
ANY		.*\n

%%

{newline}	{printf("newline\n");}
{ANY}		{printf("yylex()::What?\n");}

%%

int main()
{
	yylex();
	return 0;
}
