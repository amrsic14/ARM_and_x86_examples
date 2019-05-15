#include <stdio.h>

extern int START;
extern int END;

int __attribute__((fastcall)) index_of_x(int array[], int n, int x);

int main(){
	int n = &END - &START;
	int *array = &START;
	int x;
	scanf("%i", &x);
	int index = index_of_x(array, n, x);
	
	printf("\nIndex: %i\n", index);
	return 0;
};
