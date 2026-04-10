// Codigo Original
#include <stdio.h>

int main() {
    register int i;
    register double a = 0;
    for (i = 0; i < 40000000; i++)
       a+= 0.0000001;
    printf("El valor calculado es: %f\n", a);
    return 0;
}
