#include <stdlib.h>
#include <stdio.h>
#include <xmmintrin.h>
// SSE trabaja con 128 bits
// int pesa 4byte = 4bits
// en 128 bits pueden entrar 4 enteros

#define elementos  100000000

int main() {
	int
		i,
		fin = elementos - (elementos % 4),
		*v;

	if( posix_memalign((void**)&v, 16, elementos * sizeof(int)) != 0){
		return 1;
	}


	//no vectorizar este for
	for (i = 0; i < elementos; i++){
		v[i] = i;
	}

	// Vectorizacion
	// seteamos valores a utilizar
	__m128i
		umbral	=	_mm_set1_epi32(50000000),
		suma5 	=	_mm_set1_epi32(5),
		resta5	=	_mm_set1_epi32(-5);

	// recorrido del arreglo
	for (i = 0; i < fin; i += 4){

		__m128i

			//cargamos 4 elementos enteros
			datos = _mm_load_si128 ((__m128i*)&v[i]),

			//	realizamos comparacion datos > umbral
			// 0x000... = falso, 0xFFF... = verdadero
			mascara = _mm_cmpgt_epi32(datos,umbral),

			// operaciones bitwise
			ajuste = _mm_or_si128(
				_mm_and_si128(mascara, resta5),
				_mm_andnot_si128(mascara, suma5));


		// realizamos operacion
		datos = _mm_add_epi32(datos,ajuste);

		// guardamos en el espacio original
		_mm_store_si128((__m128i*)&v[i],datos);
	}

	for(; i<elementos; i++){
		v[i] = (v[i]>50000000) ? v[i]-5 : v[i]+5;
	}

	printf("elemento 0: %d\n",v[0]);
	printf("elemento 499999999: %d\n",v[49999999]);
	printf("elemento 500000000: %d\n",v[50000000]);
	printf("elemento 999999999: %d\n",v[99999999]);
	return 0;
}
