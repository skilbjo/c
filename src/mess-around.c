#include<stdio.h>

void print_hello_world(){
  printf("Hello world!\n");
}

int print_arg_count(int arg_count){
  /* Remember, name of program is always the first argument*/
  return arg_count;
};

int main(int argc, char *argv[]){
  print_hello_world();
  printf("Arg count is: %d \n", print_arg_count(argc));

  if ( argc > 1 ){
    for (int i=0;i < argc; i++){
      printf("argv[%d]: %s\n",i,argv[i]);
    }
  }

  /* Segfaults, unless you gave it a lot of args! */
  printf("%s",argv[100]);
  return 0;
}
