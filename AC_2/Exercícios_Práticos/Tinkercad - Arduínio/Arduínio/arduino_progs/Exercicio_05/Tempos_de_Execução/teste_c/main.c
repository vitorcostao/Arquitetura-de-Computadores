#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// C n�o serve para avaliar tempo de opera��es, o sistema operacional interfere no tempo de execu��o
int main()
{
    clock_t inicio, fim, T;
    float Tempo, media=0;
    int c;
 //   float *i, *j,x=3,y=1;
 //   i=&x;
 //   j=&y;
    int k, num1=1, num2=3;
    T=CLOCKS_PER_SEC;
    for (k=1;k<=10;k=k+1)
    {   inicio=clock();
        for (c=1;c<=10000000;c=c+1);
        fim = clock();
        Tempo =( (fim - inicio)*1000/CLOCKS_PER_SEC);
        printf("\nTempo : %g ms.", Tempo);
        media=media+Tempo;
    }
    printf("\nTempo gasto media: %g ms.", media/10);
}
