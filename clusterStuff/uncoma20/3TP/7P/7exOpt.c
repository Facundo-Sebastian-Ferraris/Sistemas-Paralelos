#include <stdlib.h>
#define X 1000000

int main() {
   int i, j, **m, cond;
   m = malloc(900 * sizeof(int*));
   for (i = 0; i < 900; i++)
      m[i] = malloc(X * sizeof(int));


   for(i = 0; i < 900; i++){
    	cond = (i >= 300) + (i >= 600);
    	for(j = 0; j < X; j++)
        	m[i][j] = cond;
   }
   return 0;
}


