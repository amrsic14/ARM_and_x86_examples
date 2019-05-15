#include <stdio.h>

void __attribute__((fastcall)) obrada(int niz[], int n, int x);
extern POCETAK, KRAJ;

int main(){
	int n = &KRAJ - &POCETAK, x, i;
	int *niz = &POCETAK;
	printf("Unesite broj siftovanja niza.\n");
	scanf("%i", &x);
	printf("Stari niz:\n");
	for(i = 0; i < n; i++)
		printf("%i	", niz[i]);
	printf("\n");
	obrada(niz, n, x);
	printf("Novi niz:\n");
	for(i = 0; i < n; i++)
		printf("%i	", niz[i]);
	printf("\n");
	return 0;
}	
