#include <stdio.h>
int main(){
   int a[3][4];
   printf("\033[2J\033[1;1H");
   for(int i = 0; i<3;i++){
      for(int j = 0; j<4;j++){
         printf("a[%d][%d] = %p\n", i, j, &a[i][j]);
      }
   }
   printf("\nConclusion: las direcciones se guardan en filas de a 4bytes\n\n");
   return 0;
}
