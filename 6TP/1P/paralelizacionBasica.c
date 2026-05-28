#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int main(){
	int id;
	#pragma omp parallel\
		num_threads(10)\
		private(id)
	{
		id = omp_get_thread_num();
		usleep(500);
		printf("<%d/%d>\n", id, omp_get_num_threads()-1);
	}
	printf("[%d]\n", omp_get_num_threads());
	return 0;
}
