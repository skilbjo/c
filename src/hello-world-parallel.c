#include <stdio.h>
#include <omp.h>
#include <stdlib.h>

int nthreads, tid;

int main (int argc, char *argv[]) {
  #pragma omp parallel private(nthreads, tid)
  {
    // All threads do this
    tid = omp_get_thread_num();
    printf("Hello from thread %d \n", tid);

    // Only master thread does this
    if (tid == 0){
      nthreads = omp_get_num_threads();
      printf("Number of threads = %d \n", nthreads);
    }
  }
}
