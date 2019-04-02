
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[{]     {
          return ACHAVE;
        }

[}]     {
          return FCHAVE;
        }

[:]     {
          return DPONTOS;
        }

[,]     {
          return VIRG;
        }

[[]     {
          return ACOLCH;
        }

[]]     {
          return FCOLCH;
        }

[0-9]+  {
          return INT;
        }

[0-9]+[.][0-9]+  {
          return FLOAT;
        }

["][a-zA-Z0-9 \t]+["]  {
          return STRING;
        }

\n   ;

[ \t]+   ;


.     ;//{yyerror("Token nao reconhecido!\n");}




%%

int yywrap() {
  return 1;
}
