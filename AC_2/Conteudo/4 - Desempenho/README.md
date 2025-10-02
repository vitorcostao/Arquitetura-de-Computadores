# Resumo: Desempenho

## Medidas de Desempenho

Há uma diferença entre tempo total para execução de um programa e o tempo gasto pelo processador (CPU time) em benefício
deste programa (Não inclui tempo de execução de outros programas, nem tempo de espera por I/O).

Além disso, o tempo de CPU está dividido em CPU do usuário, que é o tempo gasto executando instruções do programa do usuário
e o tempo de CPU do sistema, que é o tempo gasto para execução das tarefas do SO.

## Definições

- Período de clock T = Tempo de duração de um ciclo de clock.
- Frequência de operação F = Número de ciclos de clock por tempo.
- Ciclos de Clock = Intervalos básicos de tempo nos quais são executadas operações elementares de uma instrução

## MIPS, Milhões de Instruções por Segundo

Como o próprio título diz, MIPS significa milhões de instruções por segundo e pode ser calculado por:

$$MIPS = \frac{Nintruções}{CPUtime * 10^6}$$

Por mais que MIPS seja algo relevante, não é interessante comparar máquinas com MIPS devido aos seguintes problemas:

- Máquinas com diferentes conjuntos de instruções terão o número de instruções diferentes para um mesmo programa
- MIPS varia de um programa para outro na mesma máquina
- MIPS pode variar inversamente ao desempenho

Com isso, para realizar comparação entre máquinas o ideal é utilizar métricas que dependam de vários fatores, por exemplo,
do tempo necessário para cada instrução, a quantia de instruções e as características da máquina.
Assim, tem-se a equação de performance da CPU:

$$CPU = NCiclosClock * TClock$$

  
$$CPU = \frac{Nclock}{FClock}$$

## Relação entre CPU time como SpeedUp

Como visto anteriormente, o SpeedUp é a razão entre os tempos de execução antes e depois da melhoria, logo:

$$SpeedUp = \frac{CPU1}{CPU2}$$


## Outras métricas

### **Ciclos por Instrução(CPI)**
O CPI é uma métrica usada para avaliar o desempenho de um processador. 
Ele representa a quantidade média de ciclos de clock que o processador precisa para executar cada instrução de um programa. 
Isso acontece porque diferentes instruções podem exigir tempos distintos de execução, pois algumas instruções simples, como uma soma, podem ser concluídas em poucos ciclos,
enquanto instruções mais complexas, como multiplicações ou acessos à memória, podem demandar mais ciclos.


### **Contador de instruções(IC)**

O IC basicamente é a quantidade de instruções que um determinado programa possui, através dele é possível
calcular o CPU time, uma vez que a quantia de instruções influencia diretamente no tempo de execução
de um programa.

### CPI médio

Em alguns programas, as instruções podem variar entre os seus tipos, por exemplo, é possível ter instruções
aritmeticas, instruções de memória, instruções de desvio e entre outros tipos, ou seja, para cada tipo de instrução,
tem-se um CPI específico. Logo, é necessário calcular o CPI médio da máquina que pode ser obtido por:

$$CPI_{medio} = \frac{\sum_{i=1}^{n} IC_i \cdot CPI_i}{\sum_{i=1}^{n} IC_i}$$

### Equação da CPU 

Tem-se, portanto, a equação da CPU:

$$CPU = IC * CPI * Tclock$$


## Benchmark

Um benchmark é um teste utilizado para medir e comparar o desempenho de sistemas de computação. 
Ele consiste na execução de tarefas específicas, que podem simular aplicações reais ou operações intensivas,
a fim de avaliar a velocidade e a eficiência de um processador, de uma memória ou de um software. 
Embora não represente todas as situações de uso, o benchmark fornece uma medida padronizada 
que ajuda a comparar diferentes máquinas ou verificar ganhos de desempenho após melhorias no sistema.












