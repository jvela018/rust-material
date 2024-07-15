#include <stdio.h>

// https://en.wikipedia.org/wiki/Dangling_pointer

/*
void f() {
	int *x = malloc(sizeof(int));
	*x = 1024;
	printf("%d\n", *x);

	// free in some place
	{
		free(x);
		x = 0;
	}

	// try to use it again
	printf("%d\n", *x);
}


void f2() {
	// stack
	int x = 5;

	int* y = &x;
	*y += 1;

	// free at some place
	if(y) {
		free(y);
	}
}


void f3() {
	int *x = malloc(sizeof(int));
	*x = 3;
	printf("%p\n", x);

	{
		int y = 100;
		x = &y;
		printf("%p\n", x);
	}

	printf("%p\n", x);
}
*/
void f4() {
	unsigned long a[1];
	a[3] = 0x7ffff7b36cebUL;
}

int main(int argc, char **argv) {
/*
	printf("f  >>\n");
	f();

	printf("f2 >>\n");
	f2();

	printf("f3 >>\n");
	f3();

	printf("f3 >>\n");
	f3();
*/
	printf("f4 >>\n");
	f4();

	return 0;
}
