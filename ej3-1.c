#include <stdio.h>
int main(){
   int
      num,
      *p1,
      **p2;

   num = 123;  //guarda el numero 123
   p1 = &num;  //guarda la direccion donde se encuentra num (123)
   p2 = &p1;   //guarda la direccion donde se encuentra p1 (num (123))

   *p1 = num - 23;   //accede al valor de p1 (123) y resta 23 (100)
   **p2 = *p1 * 2;   //accede al valor del valor de p1 (100) y multiplica por 2 (200)

   printf("Valor de num = %d\n", num);
   return 0;
}
