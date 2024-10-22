#include <stdio.h>

struct array
{
	int x;
    int y;
    int z;
    int k;
};

int demo1(struct array a)
{
	printf("%d %d %d %d\n",a.x,a.y,a.z,a.k);
	return 100;
}

int demo2( int (*fn)(struct array)) {
    struct array a;
    a.x = 1;
    a.y = 2;
    a.z = 3;
    a.k = 4;
    return (*fn)(a);
}