#include <stdio.h>

extern int START;
extern int END;

void __attribute__((fastcall)) sort_array(int niz[], int n);

int main(){
  int n;
  int *niz;
  n = &END - &START;
  niz = &START;
	int i = 0;
	printf("originalni \n");
  for(i; i < n; i++)
    printf("%i ", niz[i]);
  sort_array(niz, n);
  i = 0;
printf("\nsortirani \n");
  for(i; i < n; i++)
    printf("%i ", niz[i]);
  return 0;
};
