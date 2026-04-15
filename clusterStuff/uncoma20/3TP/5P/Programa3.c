//Codigo con:
//	- 	desenrrollado de bucles
//	-	reduccion de dependencias entre instrucciones
#include <stdio.h>

int main() {
    register int i;
    register double a = 0, a1 = 0, a2 = 0, a3 = 0;
    for (i = 0; i < 40000000; i+=4) {
          a+= 0.0000001;
          a1+= 0.0000001;
          a2+= 0.0000001;
          a3+= 0.0000001;
    }
    a+=a1+a2+a3;
    printf("El valor calculado es: %f\n", a);
    return 0;
}
