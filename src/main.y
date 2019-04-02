

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int valid;
%}

%token ACHAVE FCHAVE DPONTOS VIRG ACOLCH FCOLCH INT STRING FLOAT 
%left ACHAVE STRING

%%
//  espacos  dentro da string 3/4
PROGRAMA:
        PROGRAMA OBJETO { 
	printf ("VALIDO\n");
	}
        |
        ;

OBJETO:	//para o objeto pai principal
        ACHAVE EXPRESSAO FCHAVE { 
	}
        
        ;


EXPRESSAO:
    STRING DPONTOS ELEM   { //expressao com um  nome e elemento para um objeto
          }


    | EXPRESSAO VIRG EXPRESSAO  { //para mais de uma expressao em um objeto
        }

    |   STRING DPONTOS ACHAVE EXPRESSAO FCHAVE { //para um objeto filho
        }
    


LISTA:	//para usar listas como elementos
ACOLCH ELEM LISTAGEM FCOLCH{}

	| ACOLCH FCOLCH{}


LISTAGEM:	//para fazer uma recursao na lista e ter varios elementos

	VIRG ELEM{}

	| VIRG ELEM LISTAGEM{}


ELEM:	//elementos como inteiros e strings
	STRING {}

	| FLOAT {}

	| INT {}

	| LISTA{}

    ;





%%

void yyerror(char *s) {
    printf("INVALIDO\n");
}

int main() {
//extern int yydebug;
  // yydebug = 1;

  yyparse();
    return 0;

}
