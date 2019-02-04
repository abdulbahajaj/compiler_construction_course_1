%{
/* This scanner handles invalid character errors */
/*==================================================*/
/*========== Global Variables ======================*/
/*==================================================*/
#define RWORD 		0
#define SSYMBOL		1
#define NUMBER		2
#define ERR		3

int tokenCat;
int lineno = 1;

typedef enum{
	END, ERROR,	/* book-keeping */
	HELLO, BYE,	/* reserved word */
	DASH,		/* special symbol */
	NUM		/* other tokens */
} TokenType;
/*==================================================*/
void printToken(const char* lexeme);
%}

a a
b b
ab ab
digit		[0-9]
number		{digit}+
newline		\n
whitespace	[ \t]+

%%

{a} {printf("I am A\n");}
{b} {printf("I am B\n");}
{ab} {printf("I am AB\n");}
"hello"		{tokenCat = RWORD; return HELLO;}
"bye"		{tokenCat = RWORD; return BYE;}
"-"		{tokenCat = SSYMBOL; return DASH;}
{number}	{tokenCat = NUMBER; return NUM;}
{newline}	{lineno++;}
{whitespace}	{printf("WS \n");}
"end"		{return END;}
.		{tokenCat = ERR; return ERROR;}

%%

int main(int argc, char * argv[]){
	TokenType currentToken;
	while((currentToken = yylex())!= END){
		printToken(yytext);
	}
	printf("Exiting the scanner.\n");
	return 0;
}

void printToken(const char* lexeme){
	switch(tokenCat){
		case RWORD:
			printf("Line: %d, Lexeme: %s, Token Type: Reserved Word\n",lineno,lexeme);
			break;
		case SSYMBOL:
			printf("Line: %d, Lexeme: %s, Token Type: Special Symbol\n",lineno,lexeme);
			break;
		case NUMBER:
			printf("Line: %d, Lexeme: %s, Token Type: Number\n",lineno,lexeme);
			break;
		case ERR:
			printf("Line: %d, Invalid character: %s\n",lineno,lexeme);
			break;
		default:
			printf("Unknown category.\n");
			break;
	}	
}


