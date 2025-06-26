#include "symboltable.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

Symbol *symbolTable = NULL;

void insert(char *name, int value) {
    Symbol *current = symbolTable;
    while (current != NULL) {
        if (strcmp(current->name, name) == 0) {
            current->value = value;
            return;
        }
        current = current->next;
    }

    Symbol *newSymbol = (Symbol *)malloc(sizeof(Symbol));
    newSymbol->name = strdup(name);
    newSymbol->value = value;
    newSymbol->next = symbolTable;
    symbolTable = newSymbol;
}

int lookup(char *name) {
    Symbol *current = symbolTable;
    while (current) {
        if (strcmp(current->name, name) == 0)
            return current->value;
        current = current->next;
    }
    return -1;
}
