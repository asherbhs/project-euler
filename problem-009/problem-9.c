#include <stdio.h>

int main() {
    for (int a = 0; a < 500; a++) {
        for (int b = a + 1; b < 500; b++) {
            for (int c = b + 1; c < 500; c++) {
                if (a * a + b * b == c * c && a + b + c == 1000) {
                    printf("%d\n", a * b * c);
                    goto done;
                }
            }
        }
    }
    done:
}