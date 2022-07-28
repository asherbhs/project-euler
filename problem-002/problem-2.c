#include <stdio.h>

int main() {
    int fib1 = 1;
    int fib2 = 2;
    int sum = 0;
    while (fib1 <= 4000000) {
        if (fib1 % 2 == 0) sum += fib1;
        int hold = fib1;
        fib1 = fib2;
        fib2 = fib2 + hold;
    }
    
    printf("%d\n", sum);
}