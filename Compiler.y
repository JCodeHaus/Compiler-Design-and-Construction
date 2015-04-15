%{
#define	YYSTYPE	double 	/* data type of yacc stack */
#include <stdio.h>
int yyerror(char *s);
int yylex(void);
int label =1;
%}
%token if then while do begin end or and number id assign
%token	<val>	NUMBER
%token	<index>	VAR
%type	<val>	expr
%right	'='
%left	'+' '-'
%left	'*' '/'
%left	UNARYMINUS
%%

pgrm: stmt                  { printf("halt\n"); }
;
stmt    :
    id{printf("lvalue:\t%g\n",$1);} ':''=' expr { printf(":=\n");}
  | if expr{printf("GOFALSE\tlabel%d\n",label);} then stmt {printf("LABEL\tlabel%d\n",label);}
  | while expr do stmt
  | begin opt_stmts end
  | expr
  ;
opt_stmts :
    stmt_list
  | 
  ;
stmt_list :
  |  stmt_list ';' stmt
  | stmt
  ;
expr : number
  |  expr '+' term           { printf("ADD\n");  }
  | expr '-' term           { printf("SUB\n");  }
  | expr OR term            { printf("OR\n");   }
  | term
  ;
term :
    term '*' factor         { printf("MPY\n");   }
  | term '/' factor         { printf("DIV\n");   } //or DIV
  | term '%' factor         { printf("MOD\n");   } //or MOD
  | term AND factor         { printf("AND\n");   }                  //what is AND??
  | factor
  ;
factor :
    ID
  | number                  { printf("PUSH\t%g\n",$1);}//this might be off when i convereted to using the lexxer
  | '(' expr ')'
  ;

%%
	/* end of grammar */

#include <stdio.h>
#include <ctype.h>
char	*programname;	/* for error messages */
int	linenumber = 1;

int main(int argc, char *argv[])
{
	programename = argv[0];
	yyparse();
}
int yylex()
{

	int c;


	while ((c=getchar()) == ' ' || c == '\t')
		;
	if (c == EOF)
		return 0;
	if (c == '.' || isdigit(c)) 
  {	/* number */
		ungetc(c, stdin);
		scanf("%lf", &yylval);
		return NUMBER;
	}
  if (isalpha(c))
  {
    int indx=0;
    char string[32];
    while ( c != EOF && isalnum(c))
    {
      string[indx]=c;
      indx++;
      c=getchar();
    }
    string[indx]='\0';
    //printf("found %s \n",string);
    ungetc(c,stdin);
    if ( strcmp(string,"if") == 0){
      return IF;
    }
    else if (strcmp(string,"then") == 0){
      return THEN;
    }
    else if (strcmp(string,"while") == 0){
      return WHILE;
    }
    else if (strcmp(string,"do") == 0){
      return DO;
    }
    else if (strcmp(string,"begin") == 0){
      return BEGIN;
    }
    else if (strcmp(string,"end") == 0){
      return END;
    }
    else if (strcmp(string,":=") == 0){
      return ASSIGN;
    }
    else if (strcmp(string,"and") == 0){
      return AND;
    }
    else if (strcmp(string,"or") == 0){
      return OR;
    }else{
      printf("RVALUE\t%s\n",string);
      return ID;
    }
  }
	if (c == '\n')
		lineno++;
	return c;
}

int yyerror(char *s)
{
	warning(s, (char *)0);
}

int warning(char *s, char *t)
{
	fprintf(stderr, "%s: %s", programname, s);
	if (t && *t)
		fprintf(stderr, " %s", t);
	fprintf(stderr, " near line %d\n", lineno);
}
