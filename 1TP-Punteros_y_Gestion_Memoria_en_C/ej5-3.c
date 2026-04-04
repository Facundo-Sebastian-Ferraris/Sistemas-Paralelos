#include <stdio.h>
#include <stdlib.h>

int main(){
	int X = 3;
	int Y = 4;	

	// guardo la referencia al malloc en a
	int *a = (int*) malloc(X*Y*sizeof(int));

	// guardo un conjunto de puntores que referencias a cada X de a
	int **x = (int**) malloc(X*sizeof(int*));

	// asigno las ubicaciones de X en el conjunto de punteros
	for(int i = 0; i < X; i++){
		*(x+i) = a + i*Y;
	}

	// asignar valores recorriendo el arreglo
	for(int i = 0; i < X; i++){
		for(int j = 0; j < Y; j++){
			*(*(x+i)+j) = i+j;
		}
	}

	for(int i = 0; i < X; i++){
		for(int j = 0; j < Y; j++){
			printf("[%d]",*(*(x+i)+j));
		}
		printf("\n");
	}

	free(a);
	free(x);

	return 0;
}
