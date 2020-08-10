/*
 * Recursively computes Fibonacci numbers.
 * CSC 225, Assignment 6
 * Given code, Winter '20
 * TODO: Complete this file.
 */

#include "fib.h"
#include <stdio.h>

int main(void) {
        int x;

        printf("Enter an integer: ");
        scanf("%d", &x);
        printf("f(%d) = %d\n" , x , fib(x));
        
        return 0;
}
