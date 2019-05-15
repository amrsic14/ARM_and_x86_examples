#include <stdio.h>

extern int START;
extern int END;

int __attribute__((stdcall)) remove_x(int array[], int n, int x);

int main(){
	int n = &END - &START;
	int *array = &START;
	int x = 3;
	int new_size = remove_x(array, n, x);
	int i = 0;
	for(i; i < new_size; i++){
		printf("%i ", array[i]);
	};
	return 0;
}
