# c

## compile
You have two options: compile on your own, or use make (build automation tool)

### on your own

    c99 src/hello-world.c -o artifact/hello-world

### make

    make || make -f my_make_file_here

#### composition of makefile

    # This is a comment
    CC=c99
    CFLAGS= -c Wall
    all:
      prog

    prog: artifact/hello-world
      $(CC) artifact/hello-world

    artifact/hello-world: src/hello-world.c
      $(CC) $(CFLAGS) src/hello-world.c

    clean:
      rm -rf *o

### even easier
Shell scripts around make :)

    bin/compile
