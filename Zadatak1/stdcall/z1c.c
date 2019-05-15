#include <stdio.h>

extern int NIZ_POCETAK;
extern int NIZ_KRAJ;

void __attribute__((stdcall)) obrada(int niz[], int n);

int main(){
  int n;
  int *niz;
  n = &NIZ_KRAJ - &NIZ_POCETAK;
  niz = &NIZ_POCETAK;
  obrada(niz, n);
  int i = 0;
  for(i; i < n; i++)
    printf("%i ", niz[i]);
  return 0;
};
