#include <stdio.h>
int main(){

   int *p; 
   p = (int *) malloc(sizeof(int));    // malloc retorna un void* para que vos puedas
                                       // recastearlo de acuerdo a lo que vaya a conter
                                       // si contiene chars, al castear como char
                                       // cuando tengas que recorrer el puntero
                                       // lo hara de byte a byte, y si fuese int
                                       // lo hara de 4bytes a 4bytes.
   *p = 50;
   return 0;
}
