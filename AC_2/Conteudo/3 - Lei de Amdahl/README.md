# Resumo: Lei de Amdahl

## Introdução

A **Lei de Amdahl** é um princípio fundamental da computação paralela que descreve o limite de aceleração possível ao utilizar múltiplos processadores ou otimizar uma parte do sistema.

Tal lei é definida como:
**“O ganho de desempenho obtido ao melhorar uma parte do sistema é limitado pela fração de tempo em que essa parte é utilizada durante a execução total.”**

---

## Fórmula

Seja:

* ( S ) = SpeedUp do melhoramento.
* ( Fm ) = Fração melhorada.
* ( K ) = Fator de Melhora.

A fórmula é:


$$S = \frac{1}{(1 - Fm) + \frac{Fm}{K}}$$

