#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
	int exp = 3;
	printf("exp = %i\n",exp);
	printf("powf(2.0,%d) = 0x%08x\n",powf(2.0,exp));
}

