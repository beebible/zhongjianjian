%{
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define yywrap()  1
double score = 0;
FILE* fp;
%}
KEY0 (UPDATE)
%%
{KEY0}    {score+=5;}
[\t\n]|. {}
&exit {yyterminate();}
%%
main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	fp = fopen(argv[2], "w");
    yylex();
	fprintf(fp,"%f",score);
	fclose(fp);
}
