%{
/* This scanner is the somehow the combination of previous examples. This one may be useful if want to know how to start your project phase 1 */
#include <stdio.h>
/*==================================================*/
/*========== Global Variables ======================*/
/*==================================================*/
FILE * source;

#define PAT_1 		0
#define PAT_2		1
#define RWORD 		2
#define SSYMBOL		3
#define ERR		4

int tokenCat;
int lineno = 1;

typedef enum{
	END,ERROR,	/* Book Keeping */
	HELLO, BYE,	/* Reserved Words */
	DASH,		/* Special Symbols */
	P1,P2		/* Other Tokens */		
} TokenType;
/*==================================================*/
void printToken(const char* lexeme);
%}

digit		[0-9]
letter		[a-zA-Z]
pattern1	{digit}+
pattern2	{letter}+
newline		\n
whitespace	[ \t]+
comment		"#".*"@"

%%

{pattern1}	{tokenCat = PAT_1; return P1;}
{pattern2}	{tokenCat = PAT_2; return P2;}
{newline}	{lineno++;}
{whitespace}	{/* Skipping White-spaces */}
{comment}	{/* Skipping comments */}
<<EOF>>		{return END;}
.		{tokenCat = ERR; return ERROR;}

%%

int main(int argc, char * argv[])
{	
	TokenType currentToken;
	char inputFile[120];
	if(argc !=2){
		fprintf(stderr, "usage: %s <filename>\n",argv[0]);
		exit(1);
	}
	strcpy(inputFile, argv[1]);
	source = fopen(inputFile,"r");	
	if(source==NULL){
		fprintf(stderr, "File %s not found.\n",inputFile);
	}
	yyin = source;
	while((currentToken=yylex()) != END){	
	printToken(yytext);
	}
	printf("Exiting the scanner.\n");
	fclose(source);
	return 0;
}

void printToken(const char* lexeme){
	switch(tokenCat){
	case PAT_1:
	printf("Line: %d, Lexeme: %s, Token Type: Pattern_1\n",lineno,lexeme);
	break;
	case PAT_2:
	printf("Line: %d, Lexeme: %s, Token Type: Pattern_2\n",lineno,lexeme);
	break;
	case RWORD:
	printf("Line: %d, Lexeme: %s, Token Type: Reserved Word\n",lineno,lexeme);
	break;
	case SSYMBOL:
	printf("Line: %d, Lexeme: %s, Token Type: Special Symbol\n",lineno,lexeme);
	break;
	case ERR:
	printf("Line: %d, Invalid Lexeme: %s\n",lineno,lexeme);
	break;
	default: /* should never happen */
	printf("%d: Unknown token: %s\n",lineno,lexeme);
	break;
	}
}
