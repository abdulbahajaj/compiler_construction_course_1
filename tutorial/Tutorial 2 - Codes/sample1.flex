%{
/* 
This is a simple scanner. 
If you say Hello, it will say Hi!
If you say How are you? it will say I'm fine.
If you say anything else it will say What? 
*/

#include <stdio.h>
%}

GREATING1	"Hello"
GREATING2	"How are you?"
newline		\n
ANY		.*

%%

{GREATING1}	{printf("yylex()::Hi!\n");}
{GREATING2}	{printf("yylex()::I'm fine.\n");}
{newline}	{printf("newline\n");}
{ANY}		{printf("yylex()::What?\n");}

%%

int main()
{
	yylex();
	return 0;
}
