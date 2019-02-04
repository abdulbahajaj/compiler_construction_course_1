%{
/* This is the scanner you get for a Flex input without any rules */
#include <stdio.h>
%}



%%



%%

int main()
{
	printf("Before calling yylex().\n");
	yylex();
	printf("After calling yylex().\n");
	return 0;
}
