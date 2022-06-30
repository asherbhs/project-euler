#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool * primeIndexesTo(int n) {
    bool * ps = malloc(n * sizeof(bool));
    ps[0] = false;
    ps[1] = false;
    for (int i = 2; i < n; i++) ps[i] = true;

    for (int i = 0; i < n; i++) {
        if (ps[i]) {
            for (int j = 2 * i; j < n; j += i) ps[j] = false;
        }
    }

    return ps;
}

int main() {
    int n = 2000000;
    bool * ps = primeIndexesTo(n);
    unsigned long long sum = 0;
    for (int i = 0; i < n; i++) {
        if (ps[i]) sum += (unsigned long long) i;
    }
    free(ps);

    printf("%llu\n", sum);
}