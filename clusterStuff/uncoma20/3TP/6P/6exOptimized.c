// Optimizado
#include <stdio.h>

int main() {
	register int i, j;
	register int a = 0, a1 = 0, a2 = 0, a3 = 0;
	for (i = 0; i < 1000; i++){
		int c = i * i * i;
		for (j = 0; j < 1000000; j+=4) {
			int d = c + j;
			a	+= d;
			a1	+= d+1;
			a2	+= d+2;
			a3	+= d+3;
		}
	}
	a += a1 + a2 + a3;
	printf("El valor calculado es: %d\n", a);
	return 0;
}
