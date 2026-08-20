# Arquitetura de Computadores III - Tipos de memória e suas características

## Memória Secundária

**Armazenamento Flash (SSD)**
- Armazenamento semicondutor **não volátil**.
- **100× a 1000×** mais rápido que disco magnético; menor, mais robusto e com menor consumo.
- Maior custo/GB que disco (fica entre disco e DRAM); acesso **uniforme** (sem tempo de busca
  mecânico); potencial perda de confiabilidade com o desgaste ao longo do tempo.
- **Operações em SSD**: como não é possível sobrescrever "in-place", o SSD:
  1. faz **reescrita**, gravando a nova versão em outra página e invalidando a antiga;
  2. realiza **apagamento** em nível de bloco (granularidade maior que a escrita);
  3. executa **coleta de lixo (garbage collection)**, consolidando páginas válidas e
     apagando blocos para recuperar espaço.

**Disco rígido (HDD)**
- Componentes: **pratos** (alumínio/vidro com revestimento magnético), **cabeçote**
  (lê/escreve "voando" sobre o prato), **braço + atuador** (movem o cabeçote radialmente,
  determinando o tempo de *seek*).
- Organização física: **trilha (track)**, **setor (sector)** e **cilindro (cylinder)**
  (mesma trilha em todos os pratos).
- Cada **setor** armazena: ID do setor, dados (512 B, ou 4096 B proposto), código de
  correção de erro (ECC) e campos de sincronização/gaps.
- Um acesso a um setor passa por: **fila** → **seek** → **latência rotacional** →
  **transferência de dados** → **overhead do controlador**.

**Exemplo de cálculo de tempo de acesso**

Cenário: setor de 512 B, seek médio de 4 ms, 15.000 rpm, taxa de transferência de
100 MB/s, overhead do controlador de 0,2 ms.

$$
4 + \frac{1}{2}\Big/\Big(\frac{15000}{60}\Big) + \frac{512}{100\text{MB/s}} + 0{,}2 \approx 6{,}2\text{ ms}
$$

- Se o seek médio real for **1 ms**, o tempo médio cai para aproximadamente **3,2 ms**.
- Alguns discos usam **cache interna e prefetch** para reduzir o tempo efetivo de
  seek/rotação percebido.

---

## Memória Cache

A Cache é uma memória volátil ultrarrápida localizada no interior ou muito próxima ao processador (CPU), existe a cache on-chip que é acoplada ao processador de computadores modernos e também há cache de nível dois que é uma memória SRAM. O tempo de transmissão de dados está relacionado com o tipo de tecnologia, a arquitetura e a distância entre as memórias.

### Princípio da Localidade

O princípio da localidade é uma propriedade observada e empírica do comportamento de programas e dos padrões de acesso a dados na computação. Através dela, muitos processadores otimizam seus processos pelo fato de armazenarem dados próximos àquele que acabou de ser referenciado, como por exemplo contadores em loopings ou posições de vetores em um array.

  - Espacial: Se um dado é referenciado, seus vizinhos tendem a ser referenciados também.
  - Temporal: Um dado referenciado tende a ser referenciado novamente.

### Organização de Memória Cache

Durante processo da transmissão de informação, o processador gera endereço de memória e envia à cache. Depois disso, a cache deve verificar se existe uma cópia da posição de memória correspondente, caso haja é necessário encontrar a posição onde está esta cópia, caso o contrário é preciso trazer o conteúdo da memória principal e escolher a posição da cache onde a cópia será armazenada.

Desse modo, o mapeamento de endereços de memória principal e endereços de cache resolve os aspectos acima. Nesse contexto, existem estrátegias de organização da cache sendo diretamente mapeada, associada por conjunto ou totalmente associada.

#### Conceitos importantes

  1) Palavra: conjunto de um ou mais bytes (dados).
  2) Bloco: conjunto de uma ou mais palavras (unidade de cache).
  3) Bit válido: indica se o dado ou bloco está válido.
  4) Tag ou rótulo: parte do endereço de uma palavra na memória principal
  5) Slot: cada linha de uma cache que pode armazenar um ou mais blocos dependendo da organização da cache
  6) Comparador: compara a tag de um endereço de uma palavra com as tags dos endereços armazenados na cache.
  > OBS: Uma linha é composta pelo dado, offset, tag e entre outras informações

### Modos de mapeamento
 
<img width="827" height="420" alt="Captura de tela 2026-08-13 142515" src="https://github.com/user-attachments/assets/0feb8e44-3b36-4bc3-aba4-0143ca148f3c" />

### Exemplo de arquitetura de 32 bits com mapeamento direto

Nessa arquitetura, o endereço possui 20 bits de tag, que é para informar se aquele dado realmente é o dado que a CPU deseja, 10 bits de índice para identificar slot onde o dado está e 2 bits para offset de byte, que é utilizado para identificar o byte desejado dentro daquela palavra. Além disso, o bit de validade e tag passam por uma porta and que informa a existência do dado na memória cache. Ademais, cada slot possui 1 bit de validade, 20 bits de tag e 32 bits de dados o que representa 4 bytes.

#### Explorando localidade espacial com 32 bits

A localidade espacial diz que se um dado for referenciado, os seus vizinhos também tendem a ser. Desse modo, para explorar tal princípio, é possível construir uma arquitetura em que o endereço é dividido em 18 bits de tag, 8 bits de índice, 4 bits de offset de bloco e 2 bits para offset de byte.

Diferentemente da arquitetura mostrada acima, a presença do offset de bloco é algo novo, pois os dados compreendidos na cache não terão apenas um bloco capaz de armazenar 1 palavra de 4 bytes, mas sim um bloco capaz de armazenar 16 palavras de 4 bytes. Concluindo, o offset e bloco serve como chave do multiplexador para determinar qual é a palavra correta a ser passada. 
> OBS: Como aumentou o tamanho dos blocos, o número de índices diminui de 1024 para 256 nas devidas proporções

### Exemplo de arquitetura de 32 bits com mapeamento associativo por conjunto (4 vias)

Nessa arquitetura, o endereço terá 22 bits de tag, 8 bits de índice o que corresponde a 256 entradas e outros 2 bits. Dessa forma, o termo conjunto representa uma linha específica, por exemplo a linha 45, contendo todas as informações das quatro vias, ou seja, bit de validade, tag e dados. Para cada via, existirá a porta and com sua tag e bit de validade para indicar se aquela linha é de fato a linha correta e ao final uma porta or para indicar o acerto da cache. Quanto ao dado, para ser extraído, é usado um multiplexador 4 para 1 que utiliza como sinal de seleção a indicação de qual via obteve o acerto nas comparações anteriores, permitindo encaminhar para a CPU apenas o dado correspondente à via correta.

### Exemplo de arquitetura com mapeamento completamente associativo

Nessa arquitetura, o endereço possui apenas 5 bits para gerenciar um espaço de 32 palavras, sendo dividido exclusivamente em 3 bits de tag e 2 bits para offset. Diferentemente das arquiteturas anteriores, não existe o campo de índice, pois a memória cache é composta por um único grande conjunto que abriga todos os blocos de forma totalmente flexível.

#### Explorando a flexibilidade e o hardware

Dessa forma, a cache possui 1 único slot contendo 4 blocos, onde cada bloco é capaz de armazenar 4 palavras. Como o mapeamento é completamente associativo, qualquer bloco da memória principal pode ser posicionado em qualquer um dos blocos disponíveis da cache, eliminando os conflitos de linha.

Para localizar o dado, a CPU realiza 4 comparações simultâneas, testando a tag do endereço contra as tags de todos os blocos presentes no slot. Cada bloco possui o seu próprio circuito de verificação (bit de validade e comparador de tag), e um circuito de multiplexação utiliza o resultado dessas comparações para extrair e direcionar a palavra correta para o processador.