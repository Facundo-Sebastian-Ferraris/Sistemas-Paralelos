#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <xmmintrin.h> // SSE -msseQ.2

// SSE trabaja con 128 bits en este caso
// Un float pesa qbytes = 32bits
// Entonces la sse opera con 128/32 = Q numeros flotantes a la vez

#define N 100000000 // Tamaño del vector
#define Q 4

int main() {
	// variables para rango for
	int
		i = 0;

	float
		*vector = malloc(N*sizeof(float));

	if (!vector) {
		printf("Error al asignar memoria\n");
		return 1;
	}


	// Asignacion de valores aleatorios
	for (i = 0; i < N; i++) {
		vector[i] = 1;//((i&1)*1.23) + ((!(i&1))*4.56);
	}

	float 
		r1 = 0,
		r2 = 0,
		r3 = 0,
		r4 = 0;

	int fin = N - (N%4);
	for (i = 0; i < fin; i+=4 ) {
		r1 += vector[i];
		r2 += vector[i+1];
		r3 += vector[i+2];
		r4 += vector[i+3];
	}

	float r = r1 + r2 + r3 + r4;

	for(i = fin; i < N; i++){
		r += vector[i];
	}
	printf("valor obtenido: %f\n", r);
	free(vector);
	return 0;
}
