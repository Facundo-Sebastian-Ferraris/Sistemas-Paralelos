#include<omp.h>
#include <stdio.h>
int main () {
	long num_steps = 800000000;		//	Cantidad de pasos = +presicion
	int maxHilos = omp_get_max_threads();
	double 
		step = 0,
		pi = 0, 
		sum[maxHilos];

	for(int i = 0; i < maxHilos; i++){
		sum[i] = 0;
	}

	step = 1.0/(double) num_steps;		// Ancho de cada rectangulo
	
	printf("step: %f\n", step);

	// Intencion de la parte paralela: dependiendo de la cantidad de hilos que tenga
	// cada uno hara solucionara un cierto rango de rectangulos
	// Para ellos es importante cuantos hilos disponibles nos dara el pragma
	// Y de ahi asignar el rango que le responda de acuerdo a su id
	omp_set_dynamic(1);
	#pragma omp parallel 
	{
		int 
			cantidadHilos	= omp_get_num_threads(),	// Cantidad de hilos disponibles 
																	//	(el profe dice que no pasa nada 
																	//	que todos los hilos hagan lo mismo)

			rectangulos	= num_steps/cantidadHilos,		//	a

			id				= omp_get_thread_num(),			//	a

			inicio 		= id * rectangulos,				//	a	

			fin			= (id != cantidadHilos)?(inicio + rectangulos): num_steps;			//	a
		
		for (int i = inicio; i < fin; i++){
			double x	=	(i + 0.5) * step;
			sum[id] +=	4.0 / (1.0 + x * x);
		}
		// printf("(%d)-\thice desde %d\thasta %d,\ty obtuve %f\n", id, inicio, fin-1,sum[id]);
	}


	for (int i = 0; i<maxHilos; i++){
		pi += sum[i];
	}
	pi *= step;
	printf("%f\n",pi);

	return 0;
}

