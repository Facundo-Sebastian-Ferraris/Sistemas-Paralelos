#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int inc(int var){
	usleep(1000);
	return var + 1;
}


int main(int argc, char **argv){
	int varA = 10;

	printf("\nprivate\n");

	#pragma omp parallel\
		num_threads(4)\
		private(varA)	
	{
		varA = inc(varA);
		printf("varA (in): %d\n", varA);
	}
	printf("varA (out): %d\n", varA);

	int varB = 10;

	printf("\nfirstPrivate\n");
	#pragma omp parallel\
		num_threads(4)\
		firstprivate(varB)	
	{
		varB = inc(varB);
		printf("varB (in): %d\n", varB);
	}
	printf("varB (out): %d\n", varB);

	int varC = 10;

	printf("\nshared\n");
	#pragma omp parallel\
		num_threads(4)\
		shared(varC)	
	{
		varC = inc(varC);
		printf("varC (in): %d\n", varC);
	}
	printf("varC (out): %d\n", varC);

	int varD = 10;
	printf("\nshared with critical:\n");
	#pragma omp parallel\
		num_threads(4)\
		shared(varD)	
	{
		#pragma omp critical
		{
			varD = inc(varD);
			printf("varD (in): %d\n", varD);
		}
	}
	printf("varD (out): %d\n", varD);

	return 0;
}
