// Normal
#include <stdio.h>

int main() {
	register int i, j;
	register int a = 0, a1 = 0, a2 = 0, a3 = 0;
	for (i = 0; i < 1000; i++)
		for (j = 0; j < 1000000; j+=4) {
			a += i * i * i + j;
			a1 += i * i * i + j + 1;
			a2 += i * i * i + j + 2;
			a3 += i * i * i + j + 3;
		}
	a += a1 + a2 + a3;
	printf("El valor calculado es: %d\n", a);
	return 0;
}
