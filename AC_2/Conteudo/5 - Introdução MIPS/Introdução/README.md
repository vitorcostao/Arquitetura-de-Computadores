# Processador MIPS (Micro processadores) - Introdução 

## Objetivo principal de um projetista de processadores:

- **Obter um conjunto de instruções que facilite a construção do hardware e do compilador**
- **Maximizar a performance**
- **Minimizar o custo**

## Linguagem de Máquina

- **Instruções ou palavras**
- **Conjunto de instruções ou vocabulário**

## Arquitetura de Von Neumann

Nesta configuração, existe a possibilidade de uma máquina digital armazenar seus programas no mesmo espaço
de memória que os dados, podendo assim manipular tais programas.


<img width="666" height="379" alt="image" src="https://github.com/user-attachments/assets/fa87de5b-2b32-41b9-befd-f5eb496cb659" />


## Arquitetura de Harvard

Baseia-se na separação de barramentos de dados da memória, permitindo que um processador pssa acessas as duas simultaneamente.

<img width="646" height="391" alt="image" src="https://github.com/user-attachments/assets/8b86b078-5a6b-4738-8111-4af4085c7c91" />

Os avanços importantes na arquitetura de computadores são tipicamente associados aos marcos no projeto do
conjunto de instruções 

As decisões de projeto devem levar em conta: 

- **Tecnologia**
- **Organização da Máquina**
- **Linguagens de Programação**
- **Tecnologia do Computador**
- **Sistemas operacionais**

### Diferença entre Von Neumann e Harvard

Apesar de claro, a separação das regiões de memória de dados e instruções possuem consequências diretas 
no desempenho, custo e complexidade dos sistemas.

No caso de Von Neumann, o processador precisa esperar o barramento ficar livre para alternar entre 
leitura de instrução e acesso a dados, ou sejam menor desempenho.

No caso de Harvard, há barramentos distintos para o tráfego de instruções e de dados, permitindo que a CPU busque
uma instrução ao mesmo tempo em que acessa dados.
Essa característica possibilita uma execução mais rápida e eficiente, pois evita o gargalo de acesso à memória
presente na arquitetura de Von Neumann.

Portanto, a arquitetura de Von Neumann é mais simples e barata, porém mais lenta devido ao uso de um 
único caminho para dados e instruções, enquanto a arquitetura de Harvard é mais rápida e eficiente, 
mas mais complexa e cara, por utilizar memórias e barramentos separados.

---

## Opções de CPU quanto ao uso de registradores

| Tipo          | Exemplo                                               | Operandos/Inst ALU | Destino do Resultado | Método de acesso aos operandos                             |
| :------------ | :---------------------------------------------------- | :----------------- | :------------------- | :--------------------------------------------------------- |
| Pilha         | B5500, B6500<br>HP2116B<br>HP 3000/70                 | 0                  | Stack                | Push & Pop Stack                                           |
| Acumulador    | PDP-8<br>Motorola 6809<br>+ ancient ones              | 1                  | Accumulator          | Acc = Acc + mem                                            |
| GPR           | IBM 360<br>DEC VAX<br>+ all modern micro's            | 2 or 3             | Registers or Memory  | Rx = Ry + mem (3)<br>Rx = Rx + Ry (2)<br>Rx = Rx + Rz (3)  |


### Exemplos de execução de instruções

Pensando na instrução C = A + B, tem-se as seguintes implementações em cada registrador.

- **Pilha:** Push A, Push B, Add, Store C.
- **Acumulador:** Load A, Add B, Store C.
- **GPR:** Load R1, A; Add R1, B; Stores C, R1

### Comparativo de códigos e instruções

| tipo        | vantagens                                                                                                    | desvantagens                                                                                               |
| :---------- | :----------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------- |
| Pilha       | • Endereço efetivo simples<br>• Instruções curtas<br>• Decodificação simples                                 | • Falta de acesso aleatório<br>• Difícil de se gerar código eficiente<br>• Pilha é muitas vezes um gargalo |
| Acumulador  | • Estado interno minimal<br>• Rápida alteração de contexto<br>• Instruções curtas<br>• Decodificação simples | • Alto tráfego de memória                                                                                  |
| GPR         | • Muitas opções de geração de código<br>• Código eficiente                                                   | • Instruções longas<br>• Muitas opções para tamanho e estrutura do conjunto de registradores               |


## Conclusão

Atualmente, as máquinas de Registradores de Propósito Geral (GPR) predominam na computação moderna. 
Essa predominância se deve, em grande parte, à influência histórica da IBM, que foi a principal fabricante 
de computadores no início da era da computação e estabeleceu padrões amplamente adotados pela indústria.

Além disso, existem muitas técnicas de compilação desenvolvidas para arquiteturas GPR, o que contribui
para sua eficiência e compatibilidade. Essa consolidação faz das máquinas GPR uma escolha adequada e 
duradoura, especialmente considerando que o software costuma ter um ciclo de vida muito mais longo que 
o hardwara.

A tecnologia de compiladores também desempenha um papel fundamental nesse contexto. 
Atualmente, ela está altamente aprimorada para arquiteturas GPR, embora também existam avanços
significativos em arquiteturas VLIW (Very Large Instruction Word). Mesmo assim, a maturidade e a ampla adoção das máquinas GPR continuam garantindo sua posição dominante no cenário da computação.