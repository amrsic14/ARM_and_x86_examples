#include <stdio.h>

extern int START;
extern int END;

void input(int array[], int n);

int sum(int array[], int n);

int main(){

	int n = &END - &START;
	int *array = &START;

	int i;
        for(i = 0; i < n; i++)
                printf("%i ", array[i]);

	input(array, n);

	for(i = 0; i < n; i++)
		printf("%i ", array[i]);

	printf("\n Sum of array: %i\n", sum(array, n));

	return 0;
};
