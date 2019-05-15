#include <stdio.h>

extern int START;
extern int END;

void __attribute__((fastcall)) reverse(int array[], int n);

int main(){
	int n = &END - &START;
	int i;
	int *array = &START;
	reverse(array, n);
	for(i = 0; i < n; i++){
		printf("%i ", array[i]);
	};
	printf("\n");
	return 0;
};

