#include <stdio.h>
int pordos(int x){
   return x*2;
}



int main(int argc, char *argv[]){
   printf("argumento agregado %c\n", *argv[1]);
   char r= (argc>0 && *argv[1]=='a');
   if(r){
      printf("procede con algoritmo con llamado de funciones\n");
   } else {
      printf("procede con algoritmo con codigo sobre linea\n");
   }


   if(r){
      register unsigned int i, res = 0;
      for (i = 0; i < 500000000; i++)
         res += pordos(i);

   } else {
      register unsigned int i, res = 0;
      for (i = 0; i < 500000000; i++)
         res += (i*2);
   }
   return 0;
}


