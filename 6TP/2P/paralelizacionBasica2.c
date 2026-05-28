#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char *argv[]){
	int id;
	#pragma omp parallel\
		num_threads(atoi(argv[1]))\
		private(id)
	{
		id = omp_get_thread_num();
		usleep(500);
		printf("<%d/%d>\n", id, omp_get_num_threads()-1);
	}
	printf("[%d]\n", omp_get_num_threads());
	return 0;
}
