#include <stdio.h>

void cleanScreen();

int main(){
	int x = 10;
	int *p;
	p = &x;
	cleanScreen();
	printf("\nDireccion de x: %p \n", &x);
	printf("Direccion almacenada en p: %p \n", p);
	printf("Valor de *p: %p \n", *p);
	
	return 0;
}




void cleanScreen(){
	printf("\033[2J\033[1;1H");
}
