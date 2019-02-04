%{
/* This scanner reads a single token, defines TokenType, keeps track of line numebrs and reports in specific format */
/*==================================================*/
/*========== Global Variables ======================*/
/*==================================================*/
#define RWORD 		0
#define SSYMBOL		1
#define NUMBER		2

int tokenCat;
int lineno = 1;

typedef enum{
	HELLO, BYE,	/* reserved word */
	DASH,		/* special symbol */
	NUM		/* other tokens */
} TokenType;
/*==================================================*/
%}

digit		[0-9]
number		{digit}+
newline		\n

%%

"hello"		{tokenCat = RWORD; return HELLO;}
"bye"		{tokenCat = RWORD; return BYE;}
"-"		{tokenCat = SSYMBOL; return DASH;}
{number}	{tokenCat = NUMBER; return NUM;}
{newline}	{lineno++;}

%%

int main(int argc, char * argv[])
{	
	TokenType currentToken;
	currentToken = yylex();
	switch(tokenCat){
	case RWORD:
		printf("Line: %d, Lexeme: %s, Token Type: Reserved Word\n",lineno,yytext);
		break;
	case SSYMBOL:
		printf("Line: %d, Lexeme: %s, Token Type: Special Symbol\n",lineno,yytext);
		break;
	case NUMBER:
		printf("Line: %d, Lexeme: %s, Token Type: Number\n",lineno,yytext);
		break;
	default:
		printf("Unknown category.\n");
		break;
	}
	return 0;
}


