#include <stdio.h>

float solucionVieja(){
	float
		i,
		j,
		a;


	for(i = 0; i < 1000; i++){
		for(j = 0; j < 1000000; j++){
			a = i + j;
		}
	}

	return a;
}

int solucionNueva(){
	int
		i,
		j,
		a;


	for(i = 0; i < 1000; i++){
		for(j = 0; j < 1000000; j++){
			a = i + j;
		}
	}

	return a;
}

int main(int arg, char *argv[]){
	if(arg < 1){
		float a = solucionVieja();
	} else {
		int a = solucionNueva();
	}
	return 0;
}
