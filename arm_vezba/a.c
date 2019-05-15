#include <stdio.h>

int sum(int array[], int n);

int main(){

	int n = 3;
	int array[3] = {1, 2, 3};

	int a = sum(array, n);

	printf("\n%i\n", a);

	return 0;
}
