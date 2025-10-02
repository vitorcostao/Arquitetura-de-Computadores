# Resumo: Lei de Amdahl

## Introdução

A **Lei de Amdahl** é um princípio fundamental da computação paralela que descreve o limite de aceleração possível ao utilizar múltiplos processadores ou otimizar uma parte do sistema.

Tal lei é definida como:
**“O ganho de desempenho obtido ao melhorar uma parte do sistema é limitado pela fração de tempo em que essa parte é utilizada durante a execução total.”**

---

## Fórmula

Seja:

* ( S ) = SpeedUp do melhoramento.
* ( T1 ) = Tempo antes da melhoria
* ( T2 ) = Tempo depois da melhoria

A fórmula pode ser expressa em:


$$S = \frac{T1}{T2}$$


---

## Análise 

O SpeedUp diz quão rápido um trabalho em uma máquina otimizada será, se comparado à não utilização de um determinado melhoramento. Além disso, é importante entender que a Lei de Amdahl depende de dois fatores:

 1) A fração do tempo de computação quepode ser convertida para tirar vantagem do melhoramento
 2) O melhoramento obtido executando-se a melhoria, o que quer dizer o quão rápido a tarefa será se o melhoramento for implementado.

Desse modo, tem-se como tempo de execução com base nas seguintes infomações:

* ( Fm ) = Fração melhorada.
* ( K ) = Fator de Melhora.

$$Td = Ta * {((1 - Fm) + \frac{Fm}{K})}$$

Logo, o SpeedUp é:

$$S = \frac{1}{(1 - Fm) + \frac{Fm}{K}}$$
