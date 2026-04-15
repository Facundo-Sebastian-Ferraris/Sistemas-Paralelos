Operaciones intrinsecas
https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html#

Convenio:

Operaciones epi:
	Las instrucciones de tipo ep son aquellas donde trata el contenido
	como un conjunto de elementos de n bits.
	Por ejemplo si es epi32, trata al contenido como un conjunto de
enteros de 32bits (va a ser un total de 4 elementos enteros).


Operaciones si:
	Las instrucciones si, son aquellas que trata el contenido como una cadena de binarios de 128bits.



RECORDAR!!!
Al recorrer por indices, si tenes que trabajar con los indices
tienes que hacer el i, i+1, i+2, i+3 ...



OPERACIONES UTILIZADAS EN CODIGO

_mm_set1_epi32(-2),
_mm_load_si128((__m128i *)&v[i]),

_mm_slli_epi32(datos, 1),

_mm_set_epi32(i+3,i+2,i+1,i),
_mm_mullo_epi32(indices,diez),

_mm_add_epi32(datos,dosn),
_mm_mullo_epi32(do2aux, dosn),

_mm_cmplt_epi32(doble, multi),

_mm_or_si128(
_mm_and_si128(mascara, doble),
_mm_andnot_si128(mascara,do2)
_mm_store_si128((__m128i*)&v[i], ajuste);


