#include <stdio.h>

extern int NIZ_KRAJ; 
extern int NIZ_POCETAK;
void __attribute__((fastcall)) obrada(int niz[], int n);

int main(){
	int * niz = &NIZ_POCETAK;
	int n = &NIZ_KRAJ - &NIZ_POCETAK; 
	obrada(niz, n);
	int i;
	printf("Elementi niza su:\n");
	for (i = 0; i < n; i++){
		printf("%i	", niz[i]);
	}
	return 0;
}
