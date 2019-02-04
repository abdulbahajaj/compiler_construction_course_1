%{
/* This scanner neglects characters between "#" and "@" */
%}

pattern		[a-z]+
comment		"#".*"@"

%%

{pattern}	{printf("Pattern Found: %s\n", yytext);}
{comment}	{/* Neglects chracaters */}

%%

int main()
{	
	yylex();	
	return 0;
}



