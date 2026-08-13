# Arquitetura de Computadores III - Introdução

Um computador é uma máquina eletrônica programável que recebe dados, processa 
informações em alta velocidade e guarda resultados. Desse modo, os computadores possuem diferentes componentes
que servem para realizar tais processamentos. Entre eles, tem-se:

- Aplicativos e Sistema Operacional.
- Arquitetura (ISA), microarquitetura, circuitos digitais e portas lógicas.
- Circuito analógico com transistores e elétrons.

Desse modo, para que um código em linguagem de alto nível seja interpretado pelo computador, é necessário que
ele passe pelo compilador, tornando-se assembly, e depois interpretado pelo assembler que converte em binário.

Uma das arquiteturas mais faladas é a de Von Neumann, representada pela imagem abaixo:

<img width="581" height="352" alt="image" src="https://github.com/user-attachments/assets/99418ed7-9010-4c3c-b3ed-4aa8864d2fd5" />

---

## Hierarquia de memória

A hierarquia de memória organiza os tipos de armazenamento de um computador em níveis, 
equilibrando velocidade, capacidade e custo. As memórias mais rápidas e caras ficam no topo perto da CPU, 
enquanto as mais lentas e baratas ficam na base, formando uma grande capacidade total de retenção de dados 
com alto desempenho.

### Níveis de hierarquia

- **Registradores**: No topo, ficam dentro do processador, são ultrarrápidos, mas têm capacidade minúscula
e custo muito alto.

- **Memória Cache (L1, L2, L3)**: Fica muito perto ou integrada à CPU, é rápida e armazena dados usados com frequência.

- **Memória Principal (RAM)**: Guarda os programas em execução no momento, é mais lenta que a cache, mas bem maior e mais barata.

- **Memória Secundária (SSD/HD)**: Fica na base, possui grande capacidade para guardar arquivos a longo prazo, mas é a mais lenta do sistema.

Registradores, L1, L2 e a memória primária são memórias RAM, que pode ser dividida em SRAM e DRAM. A memória
SRAM é composta por flip-flops e latches sendo mais rápida e menos densa em relação à DRAM. Por sua vez, a memória
DRAM é composta por capacitores e transistores.

---

## Direct Memory Access (DMA)

- **DMA** é o mecanismo que permite a um controlador de dispositivo transferir dados
  diretamente para/da memória **sem envolver a CPU** (ex.: placa de rede transferindo dados
  entre a NIC e a memória).
- Ao concluir a transferência, o dispositivo notifica a CPU por meio de uma
  **interrupção de E/S**, que é:
  - **assíncrona** em relação à execução das instruções;
  - responsável por **identificar o dispositivo** e pode carregar diferentes
    **prioridades/urgências**.
- No fluxo com DMA, CPU, memória e dispositivo de E/S se comunicam por três canais:
  **barramento de dados**, **barramento de endereços** e um sinal de **handshake**
  (controle) entre CPU e dispositivo.
- **Modelos de E/S** usados para o processador saber quando/como atender um dispositivo:
  - **E/S dirigida por interrupção**: o dispositivo interrompe a CPU quando precisa de atenção.
  - **Polling**: a CPU checa periodicamente o status do dispositivo.
  - **E/S mapeada em memória (MMIO)**: parte do espaço de endereços de memória é
    atribuída aos dispositivos.
  - **E/S mapeada em portas (PMIO)**: instruções separadas para acessar E/S e memória.
