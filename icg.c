#include "icg.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ICG 100

typedef struct {
    char result[10];
    char op1[10];
    char operator[3];
    char op2[10];
} ICG;

ICG icg[MAX_ICG];
int icg_index = 0;

void gen(char *result, char *op1, char *operator, char *op2) {
    if (icg_index < MAX_ICG) {
        strcpy(icg[icg_index].result, result);
        strcpy(icg[icg_index].op1, op1);
        strcpy(icg[icg_index].operator, operator);
        strcpy(icg[icg_index].op2, op2);
        icg_index++;
    }
}

void print_icg() {
    printf("\n--- Intermediate Code ---\n");
    for (int i = 0; i < icg_index; i++) {
        printf("%s = %s %s %s\n", icg[i].result, icg[i].op1, icg[i].operator, icg[i].op2);
    }
}
