#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

typedef struct Symbol {
    char *name;
    int value;
    struct Symbol *next;
} Symbol;

void insert(char *name, int value);
int lookup(char *name);

#endif
