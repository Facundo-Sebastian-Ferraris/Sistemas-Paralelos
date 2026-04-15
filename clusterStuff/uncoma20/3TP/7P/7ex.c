//Inicial
//Evitar saltos condicionales
#include <stdlib.h>

#define X 1000000

int main() {
	int 
		i, 
		j, 
		**m;	// puntero de punteros

	m = malloc(900 * sizeof(int*));			// puntero de 900 punteros que contendran enteros

	for (i = 0; i < 900; i++)					// recorre el m
		m[i] = malloc(X * sizeof(int));		// m[i] es un puntero a un espacio de X enteros


	for(i = 0; i < 900; i++)					// recorre de nuevo m
		for(j = 0; j < X; j++)					//	recorre m[i]
			switch (i) {
				case 0 ... 299:					//	m[i][j] = 0 si 0 <= j <= 299
					m[i][j] = 0; break;
				
				case 300 ... 599: 				//	m[i][j] = 0 si 300 <= j <= 599
					m[i][j] = 1; break;

				default:								//	m[i][j] = 0 si 600 <= j <= 899
					m[i][j] = 2; break;
			}
	return 0;
}
