#include <stdio.h>
#include <stdlib.h>
#define X 50000		//	5E4
#define Y 10000		//	E4
							//	matriz de 5E8 Elementos

int solucionInicial() {
	int i, j;
	int **m;
	m = malloc(X * sizeof(int*));
	for (i = 0; i < X; i++)
		m[i] = malloc(Y * sizeof(int));
	for(j = 0; j < Y; j++)
		for(i = 0; i < X; i++)
			m[i][j] = i + j;
	return 0;
}



int solucionOptimizada() {
	int i, j;
	int **m;
	m = malloc(X * sizeof(int*));
	for (i = 0; i < X; i++)
		m[i] = malloc(Y * sizeof(int));
	for(j = 0; j < Y; j++)
		for(i = 0; i < X; i++)
			m[j][i] = i + j;
	return 0;
}

int main(int argc, char* argv[]){
	if(argc<2)	return 1;
	printf("caracter ingresado %s", argv[1]);
	if(*argv[1]=='a'){
		solucionInicial();
	}else if(*argv[1]=='b'){
		solucionOptimizada();
	}
	return 0;
}
