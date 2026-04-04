#include <stdio.h>
int main(){
   float a[5];
   *(a+4)=10.0;
   printf("\033[2J\033[1;1HEl quinto elemento es %f\n",a[4]);
   return 0;
}
