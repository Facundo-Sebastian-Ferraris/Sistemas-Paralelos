#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <xmmintrin.h> // SSE -msse4.2

// SSE trabaja con 128 bits en este caso
// Un float pesa qbytes = 32bits
// Entonces la sse opera con 128/32 = 4 numeros flotantes a la vez

#define N 100000000 // Tamaño del vector


int main() {
	// variables para rango for
	int
		q = 4,
		i = 0,
		fin = N - (N % q); // forzar el recorrido a multiplo de q


	float
		sum_arr[q],																//	arreglo para elementos sobrantes

		// Alineacion para sse
		// nota: se utiliza multiplos de 16 ya que son q elementos de qbytes
		// la alineacion reduce fallos de cache
		*vector = (float *)aligned_alloc(16, N * sizeof(float)); //	Alineación para SSE

	// buena practica al trabajar con memoria dinamica:
	// si no es posible asignar el espacio se corta el programa
	if (!vector) {
		printf("Error al asignar memoria\n");
		return 1;
	}


	// Asignacion de valores aleatorios
	for (i = 0; i < N; i++) {
 		vector[i] = 1;//((i&1)*1.23) + ((!(i&1))*4.56);     
	}


	__m128 sum_vec = _mm_setzero_ps();				// Inicializa el registro SSE a 0


	for (i = 0; i < fin; i += q) {
		__m128 data = _mm_load_ps(&vector[i]);		// Cargar q floats
		sum_vec = _mm_add_ps(sum_vec, data);		// Sumar en paralelo
	}


	// Reducir los 4  valores a un escalar
	_mm_store_ps(sum_arr, sum_vec);


	float
		suma_total = sum_arr[0] + sum_arr[1] + sum_arr[2] + sum_arr[3];		// Sumar los elementos restantes
	for (i = fin; i < N; i++) {
		suma_total += vector[i];
	}
	printf("valor obtenido: %f\n",suma_total);
	free(vector);
	return 0;
}
