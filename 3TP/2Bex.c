#include <stdio.h>

float solucionVieja(){
	float
		i,
		j,
		a;


	for(i = 0; i < 1000; i++){
		for(j = 0; j < 1000; j++){
			a = i + j;
		}
	}

	return a;
}


int solucionNueva(int n){
	int
		a = (n*n)+1,
		b = n*(a*a);


	return b;
}


int main(){
	float a = solucionVieja();
	printf("valor solVieja: %f\n", a);
	return 0;
}
