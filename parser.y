%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symboltable.h"
#include "icg.h"

int yylex();
void yyerror(const char *s);
extern FILE *yyin;

%}

%union {
    int ival;
    char* sval;
}

%token <sval> ID STRING
%token <ival> NUMBER
%token INT PRINTF WHILE
%token EQ NEQ LE GE

%type <ival> expr condition

%left '+' '-'
%left '*' '/'
%left EQ NEQ '<' '>' LE GE

%%

program:
      program stmt
    | /* empty */
    ;

stmt:
      INT ID '=' expr ';' {
          insert($2, $4);
          printf("int %s = %d\n", $2, $4);
      }

    | ID '=' expr ';' {
          insert($1, $3);
          printf("%s = %d\n", $1, $3);
      }

    | PRINTF '(' STRING ',' ID ')' ';' {
          $3[strlen($3) - 1] = '\0';
          char *fmt = $3 + 1;
          int val = lookup($5);
          printf(fmt, val);
          printf("\n");
      }

    | PRINTF '(' STRING ')' ';' {
          $3[strlen($3) - 1] = '\0';
          printf("%s\n", $3 + 1);
      }

    | WHILE '(' condition ')' block {
    while (lookup("a") < lookup("b")) {
        printf("While loop executed\n");
        printf("Updated value: %d\n", lookup("a"));
        insert("a", lookup("a") + 1);
        printf("a = %d\n", lookup("a"));
    }
}


    | block
    ;

block:
      '{' stmt_list '}'
    ;

stmt_list:
      stmt
    | stmt_list stmt
    ;

condition:
      expr EQ expr { $$ = $1 == $3; }
    | expr NEQ expr { $$ = $1 != $3; }
    | expr '<' expr { $$ = $1 < $3; }
    | expr '>' expr { $$ = $1 > $3; }
    | expr LE expr  { $$ = $1 <= $3; }
    | expr GE expr  { $$ = $1 >= $3; }
    ;

expr:
      expr '+' expr { $$ = $1 + $3; gen("t", "t1", "+", "t2"); }
    | expr '-' expr { $$ = $1 - $3; gen("t", "t1", "-", "t2"); }
    | expr '*' expr { $$ = $1 * $3; gen("t", "t1", "*", "t2"); }
    | expr '/' expr { $$ = $1 / $3; gen("t", "t1", "/", "t2"); }
    | NUMBER        { $$ = $1; }
    | ID            { $$ = lookup($1); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <source_file>\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror("File open failed");
        return 1;
    }

    yyin = f;
    yyparse();
    fclose(f);
    print_icg();
    printf("Compilation successful\n");
    return 0;
}
