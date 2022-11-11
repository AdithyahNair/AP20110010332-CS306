%{

%}

%%
[ \t\n]+ {fprintf(yyout, "");}
.       { fprintf(yyout, "%s", yytext); }
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] {fprintf(yyout, "");}
int|endif|if|else|then {fprintf(yyout,"%s%s%s","\n",yytext,": is a keyword\n");}
%%

int main() {
  extern FILE *yyin, *yyout;
  yyin = fopen("input.txt","r");
  yyout = fopen("output.txt","w");
  yylex();
}
