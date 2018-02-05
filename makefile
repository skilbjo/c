CFLAGS = -Wall

#all: hello_world_parallel

hello-world:
	cc src/hello-world.c -o artifact/hello-world
	artifact/hello-world

hello-world-parallel:
	CC =	/usr/local/bin/gcc-6
	$(CC) $(CFLAGS) -fopenmp src/hello-world-parallel.c -o artifact/hello-world-parallel
	$(CC) $(CFLAGS) -fopenmp -S src/hello-world-parallel.c -o artifact/hello-world-parallel.s
	objdump -S --disassemble artifact/hello-world-parallel > artifact/hello-world-parallel.dump
	artifact/hello-world-parallel

matrix-multiply:
	$(CC) $(CFLAGS) src/matrix-multiply.c -o artifact/matrix-multiply
	artifact/matrix-multiply

mess-around:
	$(CC) $(CFLAGS) src/mess-around.c -o artifact/mess-around
	$(CC) $(CFLAGS) -S src/mess-around.c -o artifact/mess-around.s
	objdump -S --disassemble artifact/mess-around >artifact/mess-around.dump
	artifact/mess-around

clean:
	rm -f artifact/*

clean-assembly:
	rm f artifact/*.S
