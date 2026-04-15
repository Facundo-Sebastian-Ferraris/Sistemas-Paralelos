#include <stdio.h> 

int solucionOptima();

int main(){
	int flag = 0;	// creo flag

 
	for (i = 0; i < 1000; i++) {	// recorre i hasta 1000
		if (complex_func(a[i]) < 55){	// si el valor de a[i] es menor a 50
			flag = 1; 		// setea el flag a 1;
		}
	} 


	printf("¿Elemento encontrado? %d\n", flag); // imprime valor de verdad


	return 0;
}


int solucionOptima(){
	int flag = 0;
	int aMax = n;
	while(flag == 0 && i < aMax){
		flag = complex_func(a[i]) < 55;
		i++;
	}
	printf("¿Elemento encontrado? %d\n", flag); // imprime valor de verdad
	return 0;
}
