#include <stdio.h>
#include <stdlib.h>

typedef
struct elem
{
	int podatak;
	struct elem *sled;
}
elem_t;

elem_t * ucitajListu(int n)
{
	int i;
	elem_t *lista = NULL, *kraj, *tmp;
	for(i = 0; i < n; i++)
	{
		tmp = malloc(sizeof(elem_t));
		tmp->sled = NULL;
		scanf("%d", &tmp->podatak);
		if (lista == NULL)
		{
			lista = tmp;
			kraj = tmp;
		}
		else
		{
			kraj->sled = tmp;
			kraj = tmp;
		}
	}
	return lista;
}

void oslobodi(elem_t **lista)
{
	elem_t *tmp;
	while(*lista != NULL)
	{
		tmp = *lista;
		*lista = (*lista)->sled;
		free(tmp);
	}
}

void test()
{
	//ova funkcija ce biti menjana za potrebe testiranja koda
}

