#include <stdio.h>

extern int NIZ_POCETAK;
extern int NIZ_KRAJ;

void __attribute__((stdcall)) obrada(int niz[], int n);

int main(){

	int n = &NIZ_KRAJ - &NIZ_POCETAK;
	int *niz = &NIZ_POCETAK;
	obrada(niz, n);
	int i;
	for(i = 0; i < n; i++)
		printf("%i ", niz[i]);
	printf("\n");

	return 0;
}
