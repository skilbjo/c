/*
Naive code for multiplying two matrices together.

There must be a better way!
*/

#include <stdio.h>
#include <stdlib.h>

void matrix_multiply(double **c, double **a, double **b, int m, int n) {
  int i, j, k;
  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++)
      for (k = 0; k < n; k++)
        c[i][j] += a[i][k] * b[k][j];
}

double **twodim_alloc(int m, int n) {
  /* Allocate space for double matrix[m][n]. CALLER FREES! */
  double **matrix = malloc(m * sizeof(double));
  for (int i = 0; i < m; i++)
    matrix[i] = malloc(n * sizeof(double));
  return matrix;
}

void small_example() {
  double **c = twodim_alloc(2, 2);
  double **a = twodim_alloc(2, 3);
  double **b = twodim_alloc(3, 2);
  c[0][0] = c[0][1] = c[1][0] = c[1][1] = 0;
  a[0][0] = a[0][1] = a[0][2] = 1;
  a[1][0] = a[1][1] = a[1][2] = 2;
  b[0][0] = b[1][0] = b[2][0] = 1;
  b[0][1] = b[1][1] = b[2][1] = 2;
  matrix_multiply(c, a, b, 2, 3);
  printf("[[ %f, %f ],\n [ %f, %f]]", c[0][0], c[0][1], c[1][0], c[1][1]);
  free(a);
  free(b);
  free(c);
}

void large_example() {
  int n = 500, i, j;
  double **c = twodim_alloc(n, n);
  double **a = twodim_alloc(n, n);
  double **b = twodim_alloc(n, n);
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      c[i][j] = 0;
      a[i][j] = (double)rand() / (double)RAND_MAX;
      b[i][j] = (double)rand() / (double)RAND_MAX;
    }
  }
  matrix_multiply(c, a, b, n, n);
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++)
      printf("%f, ", c[i][j]);
    printf("\n");
  }
  free(a);
  free(b);
  free(c);
}

int main(int argc, char const *argv[]) {
  /*small_example();*/
  large_example();
  return 0;
}
