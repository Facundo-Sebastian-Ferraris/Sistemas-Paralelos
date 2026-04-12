#include <stdlib.h>
#define X 20000
#define Y 20000
int main() {
  int i, j;
  int **m = malloc(X * sizeof(int*));
  int *x = malloc(X * Y * sizeof(int));
  for (i = 0; i < X; i++)
    m[i] = &x[i*Y];

  for(i = 0; i < X; i++)
    for(j = 0; j < Y; j++)
      m[i][j] = j % 2;

  return 0;
}
