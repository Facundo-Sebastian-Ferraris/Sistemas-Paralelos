#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
int main() {
   int 
      a, 
      b,
      *x, 
      *y;

   a = 10;
   b = 20;
   x = &a;
   y = &b;
   x = y;
   *x = 5;

   return 0;
}
