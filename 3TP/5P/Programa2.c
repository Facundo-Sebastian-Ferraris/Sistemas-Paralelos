//Codigo con desenrrollado de bucles
#include <stdio.h>

int main() {
    register int i;
    //register double a;
    register double a = 0;
    for (i = 0; i < 40000000; i+=4) {
       a+= 0.0000001;
       a+= 0.0000001;
       a+= 0.0000001;
       a+= 0.0000001;
    }
    printf("El valor calculado es: %f\n", a);
    return 0;
}
