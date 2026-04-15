#include <stdlib.h>
#include <stdio.h>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>


#define E  		1000005
#define Size	(sizeof(int))
#define Q		(128/Size)

int main() {
	int
		i 	 = 0,
		fin = E-(E%4),
		*v;

	if( posix_memalign((void**)&v, Q*Size, E*Size) != 0){
		printf("error posix memalign");
		return 1;
	}
	

	// no vectorizar este for
	for (; i < E; i++){
		v[i] = rand() % 10000;
	}


	printf("v[0]=%11d, ", v[0]);
	printf("v[11]=%11d, ", v[11]);
	printf("v[E-1]=%11d\n", v[E-1]);

	__m128i
		dosn 	= _mm_set1_epi32(-2),
		diez	= _mm_set1_epi32(10);

	for (i = 0; i < fin; i += 4) {

		__m128i
			datos = _mm_load_si128((__m128i *)&v[i]),

			// 2 * v[i]
			doble = _mm_slli_epi32(datos, 1),

			// i * 10
			indices	= 	_mm_set_epi32(i+3,i+2,i+1,i),
			multi		=	_mm_mullo_epi32(indices,diez),

			// (v[i] - 2) * (-2)
			do2aux = _mm_add_epi32(datos,dosn),
			do2 = _mm_mullo_epi32(do2aux, dosn),

			mascara = _mm_cmplt_epi32(doble, multi),

			ajuste = _mm_or_si128(
							_mm_and_si128(mascara, doble),
							_mm_andnot_si128(mascara,do2)
						);

			_mm_store_si128((__m128i*)&v[i], ajuste);
	}

	for (; i < E; i++) {
		if(2 * v[i] < i * 10)
			v[i] = v[i] * 2;
		else
			v[i] = (v[i] - 2) * -2;
	}

	printf("v[0]=%11d, ", v[0]);
	printf("v[11]=%11d, ", v[11]);
	printf("v[E-1]=%11d\n", v[E-1]);
	return 0;
}
