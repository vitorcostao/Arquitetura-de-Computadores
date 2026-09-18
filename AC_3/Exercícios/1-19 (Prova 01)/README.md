# Exercícios para prova 01

## Exercício 01

A arquitetura abaixo representa uma cache que utiliza mapeamento set associativo com quatro vias e endereço de 32 bits.

Desse modo, o endereço é dividido em dois bits para offset de byte, oito bits para índice e vinte dois bits de tag. O mapeamento por set associativo permite que um endereço ocupe mais linhas possíveis para um determinado conjunto.

Cada linha possui um bit de validade, uma tag e o dado correspondente. Existem portas and que recebem o bit de validade e a resposta de uma comparação a tag do endereço e da cache para verificar se o dado realmente é o que deseja.

A porta ou serve para indicar o acerto e o mux 4 para 1 determina qual será o dado que será enviado para a CPU.

---

## Exercício 02

O tamanho de kbits da questão 01 pode ser calculada da seguinte forma.

Como existe 256 conjuntos e cada conjunto possui quatro linhas com uma palavra de 32 bits, o número de bits totais é:

$$n_{bits} = \text{conjuntos} \times \text{vias} \times (\text{bit de validade} + \text{tag} + \text{dados})$$

$$n_{bits} = 256 \times 4 \times (1 + 22 + 32)$$

$$n_{bits} = 56320 \text{ bits}$$

$$n_{bits} = 55 \text{ kbits}$$

---

## Exercício 03

Como a cache possui 64 kB de dados e cada linha possui uma palavra de 4 bytes, a quantidade de linhas é:

$$n_{linhas} = \frac{64 \times 1024}{4} = 2^{14}$$

Logo, são utilizados 14 bits para índice e 2 bits para offset de byte.

A tag possui:

$$tag = 32 - 14 - 2 = 16 \text{ bits}$$

O número total de bits da cache é:

$$n_{bits} = 2^{14} \times (1 + 16 + 32)$$

$$n_{bits} = 802816 \text{ bits}$$

$$n_{bits} = 784 \text{ kbits}$$

---

## Exercício 04

Como cada bloco possui quatro palavras de 32 bits, cada bloco possui:

$$4 \times 4 = 16 \text{ bytes}$$

A quantidade de linhas é:

$$n_{linhas} = \frac{16 \times 1024}{16} = 2^{10}$$

Logo, são utilizados 10 bits para índice, 2 bits para offset de byte e 2 bits para selecionar a palavra dentro do bloco.

A tag possui:

$$tag = 32 - 10 - 2 - 2 = 18 \text{ bits}$$

Cada bloco possui 128 bits de dados. Portanto:

$$n_{bits} = 2^{10} \times (1 + 18 + 128)$$

$$n_{bits} = 150528 \text{ bits}$$

$$n_{bits} = 147 \text{ kbits}$$


---


## Exercício 05

O tamanho de kbits da questão 01 pode ser calculada da seguinte forma.
Como existe 8192 conjuntos e cada conjunto possui duas linhas com um bloco de 8 palavras de 64 bits, o número de bits totais é:

$$n_{bits} = \text{conjuntos} \times \text{vias} \times (\text{bit de validade} + \text{tag} + \text{dados})$$
$$n_{bits} = 8192 \times 2 \times (1 + 45 + 512)$$
$$n_{bits} = 9142272 \text{ bits}$$
$$n_{bits} = 8928 \text{ kbits}$$


--- 

## Exercício 06

O gráfico analisa o impacto do aumento da **associatividade** (eixo X) sobre a **taxa de erros/faltas** (*Miss rate*, eixo Y) para diferentes **tamanhos de memória cache** (curvas de 1 KB a 64 KB).

### Principais Pontos de Análise:

1. **Redução da Taxa de Erros (*Miss Rate*):**

   * À medida que a associatividade aumenta (mudando de mapeamento direto ou *One-way* para *Two-way*, *Four-way* e *Eight-way*), a taxa de *misses* diminui em praticamente todos os tamanhos de cache.

2. **Mitigação dos *Misses* de Conflito:**

   * Caches com maior associatividade oferecem mais locais (vias) para armazenar blocos que disputam o mesmo conjunto (*set*). Isso reduz drasticamente os **erros por conflito** (*conflict misses*).

3. **Rendimentos Decrescentes:**

   * O maior ganho de desempenho ocorre na transição de **One-way** para **Two-way** e **Four-way**.
   * A partir de **Eight-way**, a melhoria na taxa de erros diminui gradativamente, tendendo a se estabilizar.

4. **Relação com o Tamanho Total da Cache:**

   * Caches maiores, como **64 KB**, mantêm taxas de *miss* consideravelmente menores que caches pequenas, como **1 KB**.
   * Em caches muito grandes, o impacto de aumentar a associatividade é menor, pois o volume de capacidade já absorve a maioria dos dados sem gerar conflitos frequentes.


---

## Exercício 07

Separar a cache L1 em dados e instruções é uma excelente técnica aplicada em arquitetura de computadores, pois através disso é possível executar ações em paralelo, ou seja, ao mesmo tempo que uma instrução é buscada
um dado também é buscado e isso reduz significativamente o tempo de processamento de dados. Outro ponto importante é que a cache-I de instruções servirá somente para leitura das instruções o que não fará com que seja
preciso utilizar write-back ou write-through.


--- 

## Exercício 08

A memória virtual é uma abstração feita pelo sistema de modo que a memória RAM é vista como sendo uma cache de grande capacidade de armazenamento, para isso é necessário armazenar tabelas de endereços na RAM que são responsáveis
pelo mapeamento do endereço virtual, que é gerado pelo processador, para o endereço físico, que é o endereço real. Desse modo, cada miss na cache implica a dois acessos à memória principal, um para
a tradução inicial e outra para buscar o dado na memória principal. 

Nesse sentido, a TLB (Translation Look-Aside Buffer) acelera o desempenho no acesso aos dados em memória, pois ela é uma cache ultrarrápida que armazena endereços mais recentemente utilzados, e, como se trata de uma cache, 
a tradução dos endereços se torna muito mais acelerado do que simplesmente utilizar a MMTT simplesmente.


---

## Exercício 09

O miss penalty corresponde ao tempo para substituir o bloco no nível superior mais o tempo para fornecer o bloco ao processador. Desse modo, se o bloco for maior o miss penalty será mais caro e se o tamanho do bloco for grande
em relação ao tamanho da cache o miss ratio aumenta juntamente com o miss penalty, o que causa um atraso gigantesco no processamento de dados.

Além disso, o tempo médio de acesso, que é a soma entre o produto do hit ratio vezes o tempo de acesso à cache e o produto do miss ratio vezes o miss penalty. Com isso, aumentar o miss ratio juntamente com o miss penalty aumenta o
tempo médio de acesso.

---

## Exercício 10

$$CPI_{ideal} = CPI_{Base} + (n_{stalls} \times m_{ratio})$$

Dada a fórmula acima, é possível determinar quanto seria o CPI ideal tendo CPI base = 1.1, 50% aritm/lógica, 30% load/store 20% desvios supondo que 10% das operações de acesso a dados na memória sejam misses.
Desse modo, basta somar 1.1 com o produto entre o número das operações de desvio e o miss ratio e a quantia de ciclos, que é 50 por miss. Logo, a resposta é 2.6


--- 

## Exercício 11

A penalidade de falha ao acessar a memória principal é de **100 ns**. Como cada ciclo de clock possui duração de **0,2 ns**, o número de ciclos necessários para realizar esse acesso é dado por:

$$\frac{100\text{ ns}}{0,2\text{ ns/ciclo}} = 500 \text{ ciclos}$$

Considerando inicialmente um processador que possui apenas cache **L1**, com um CPI base igual a **1,0** e uma taxa de falhas de **2%**, o CPI total deve incluir os ciclos de *stall* provocados pelos acessos à memória principal. Assim:

$$CPI_{total} = 1,0 + 2\% \times 500$$

$$CPI_{total} = 1,0 + 10 = 11,0$$

Ao adicionar uma cache **L2**, cuja penalidade de acesso é de **5 ns**, podemos converter esse tempo para ciclos de clock:

$$\frac{5\text{ ns}}{0,2\text{ ns/ciclo}} = 25 \text{ ciclos}$$

Nesse caso, as falhas da cache L1 passam inicialmente pela cache L2. Considerando uma taxa de falhas de **2% na L1** e uma taxa de falhas de **0,5% que chega até a memória principal**, o CPI total passa a considerar tanto o *stall* causado pelo acesso à L2 quanto o *stall* causado pelo acesso à memória principal:

$$CPI_{total} = 1 + 2\% \times 25 + 0,5\% \times 500$$

$$CPI_{total} = 1 + 0,5 + 2,5 = 4,0$$

Portanto, a utilização de uma cache L2 reduz o CPI de **11,0 para 4,0**. O ganho de desempenho pode ser calculado comparando os dois valores:

$$Speedup = \frac{11,0}{4,0} = 2,75 \approx 2,8$$

Assim, o processador com cache **L2 é aproximadamente 2,8 vezes mais rápido** do que o processador que utiliza apenas a cache L1.


---

## Exercício 12

Os três gráficos apresentam a relação entre o **tamanho da linha da cache**, a **taxa de falhas (miss ratio)**, a **penalidade de falha (miss penalty)** e o **tempo médio de acesso à memória**.

No primeiro gráfico, é possível observar que, conforme o tamanho da linha aumenta, também aumenta o **miss penalty**. Isso ocorre porque, quando acontece um miss, uma quantidade maior de dados precisa ser transferida da memória principal para a cache. Portanto, linhas maiores necessitam de mais tempo para serem carregadas.

No segundo gráfico, inicialmente o aumento do tamanho da linha reduz o **miss ratio**, pois linhas maiores permitem explorar melhor a **localidade espacial**. Quando um dado é acessado, existe uma grande probabilidade de que os dados próximos também sejam utilizados e, como eles já foram carregados para a cache, novos misses são evitados.

Entretanto, se as linhas se tornam grandes demais em relação ao tamanho total da cache, a quantidade de linhas disponíveis diminui. Isso faz com que blocos sejam substituídos com maior frequência e compromete a **localidade temporal**, fazendo com que o miss ratio volte a aumentar.

O terceiro gráfico representa a combinação desses dois efeitos no **tempo médio de acesso**. Inicialmente, aumentar o tamanho da linha reduz o tempo médio devido à diminuição do miss ratio. Entretanto, a partir de determinado tamanho, tanto o aumento do miss penalty quanto o crescimento do miss ratio fazem o tempo médio de acesso voltar a aumentar.

O comportamento pode ser representado pela expressão:

$$T_{medio} = T_{hit} + (Miss\ Rate \times Miss\ Penalty)$$

Portanto, existe um tamanho de linha intermediário que apresenta o melhor compromisso entre **localidade espacial**, **taxa de misses** e **penalidade de miss**.

---

## Exercício 13

Existem três formas principais de realizar o mapeamento de blocos na cache: **mapeamento direto**, **completamente associativo** e **associativo por conjunto**.

No **mapeamento direto**, cada bloco da memória principal possui apenas uma posição possível na cache. Dessa forma, a implementação é mais simples e possui menor custo de hardware, pois somente uma tag precisa ser comparada durante o acesso. Além disso, o tempo de acesso tende a ser menor. Entretanto, esse tipo de mapeamento apresenta maior quantidade de **misses de conflito**, pois diferentes blocos podem disputar exatamente a mesma linha da cache.

No **mapeamento completamente associativo**, um bloco da memória principal pode ser colocado em qualquer linha da cache. Isso praticamente elimina os misses causados exclusivamente pela existência de uma posição fixa. Entretanto, é necessário comparar a tag do endereço com as tags de todas as linhas da cache simultaneamente. Consequentemente, é necessário um número muito maior de comparadores, aumentando significativamente o custo e a complexidade do hardware.

O **mapeamento associativo por conjunto** representa uma solução intermediária. A cache é dividida em conjuntos e cada endereço é associado a apenas um conjunto, porém o bloco pode ocupar qualquer uma das vias existentes dentro desse conjunto. Por exemplo, em uma cache associativa de quatro vias, um bloco possui quatro posições possíveis dentro do conjunto correspondente.

Dessa forma, considerando desempenho e custo:

* O **mapeamento direto** possui menor custo e menor complexidade, porém apresenta mais misses de conflito.
* O **completamente associativo** reduz ao máximo os misses de conflito, porém possui maior custo e complexidade.
* O **associativo por conjunto** apresenta um equilíbrio entre os dois modelos, reduzindo os misses de conflito sem possuir o elevado custo de uma cache completamente associativa.

---

## Exercício 14

O endereço utilizado originalmente por um programa é um **endereço virtual**. Entretanto, para acessar efetivamente os dados armazenados na memória RAM é necessário transformá-lo em um **endereço físico ou real**.

O endereço virtual pode ser dividido em duas partes:

$$Endereço\ Virtual = Página\ Virtual + Offset$$

A página virtual identifica uma página do espaço de endereçamento do processo, enquanto o offset indica a posição desejada dentro dessa página.

Para realizar a transformação, o processador utiliza inicialmente a **TLB (Translation Look-Aside Buffer)**, que funciona como uma cache das traduções de endereços utilizadas recentemente.

Se ocorrer um **hit na TLB**, o número da página física correspondente é obtido diretamente. O número da página física é então concatenado com o mesmo offset existente no endereço virtual:

$$Endereço\ Físico = Página\ Física + Offset$$

Caso ocorra um **miss na TLB**, é necessário consultar a **tabela de páginas**, armazenada na memória principal, para descobrir qual página física corresponde à página virtual.

Depois que a tradução é encontrada, ela pode ser armazenada na TLB para acelerar acessos futuros.

Caso a página procurada não esteja presente na memória principal, ocorre uma **falta de página (page fault)**. Nesse caso, o sistema operacional precisa buscar a página na memória secundária, carregá-la para a memória principal, atualizar a tabela de páginas e então continuar a execução.

Portanto, a transformação do endereço original do programa para o endereço real ocorre através do mecanismo de **memória virtual**, utilizando principalmente a TLB e a tabela de páginas.

---

## Exercício 15

A figura representa o processo de tradução de um **endereço virtual** para um **endereço real**, utilizando uma **TLB** e uma tabela de tradução armazenada na memória principal.

Inicialmente, o processador gera um endereço virtual dividido em:

$$Endereço\ Virtual = Página + Linha$$

A parte correspondente à página é enviada para a **TLB**, enquanto a parte correspondente à linha, ou deslocamento, não precisa ser traduzida.

Se ocorrer um **hit na TLB**, significa que a tradução dessa página virtual já está armazenada nela. Dessa forma, a página física correspondente é obtida rapidamente e combinada com a linha para formar o endereço real:

$$Endereço\ Real = Página\ Física + Linha$$

Caso ocorra um **miss na TLB**, é necessário acessar a tabela de tradução localizada na memória principal.

Se a tradução for encontrada na tabela da memória principal, ela é carregada para a TLB através do caminho indicado como **carga TLB**. Depois disso, a página física obtida é combinada com a linha do endereço virtual, gerando o endereço real.

Entretanto, se também ocorrer um **miss na tabela da memória principal**, significa que a página necessária não está atualmente disponível na RAM. Nesse caso, é necessário acessar a memória secundária, indicada na figura como **disk memory translation table**, caracterizando uma falta de página.

Após a página ser carregada para a memória principal, as estruturas de tradução são atualizadas e o acesso pode continuar.

Portanto, a TLB funciona como uma cache de traduções, evitando que a tabela de páginas armazenada na memória principal precise ser acessada em todas as operações de memória.

---

## Exercício 16

A **memória virtual** pode ser utilizada como solução para o problema de possuir programas cujo espaço de endereçamento é maior do que a quantidade de memória RAM fisicamente disponível no computador.

Nesse sistema, cada programa trabalha como se possuísse um grande espaço contínuo de memória. Entretanto, os endereços utilizados pelo programa são **endereços virtuais**, que posteriormente são traduzidos para endereços físicos.

A memória virtual normalmente divide o espaço de memória em **páginas**. Apenas as páginas que estão sendo utilizadas precisam permanecer na memória principal. As demais podem permanecer armazenadas na memória secundária.

Quando uma página que não está presente na RAM é necessária, ocorre uma **falta de página (page fault)**. O sistema operacional busca essa página na memória secundária e a transfere para a memória principal. Caso não exista espaço disponível, outra página pode precisar ser substituída.

Dessa maneira, a memória RAM funciona de maneira semelhante a uma cache para os dados armazenados na memória secundária.

Além de permitir a execução de programas maiores do que a memória física disponível, a memória virtual também permite que cada processo possua seu próprio espaço de endereçamento, facilitando a **proteção e o isolamento entre processos**.

Portanto, a memória virtual resolve principalmente problemas relacionados à **limitação da capacidade da memória física**, ao gerenciamento da memória e à proteção dos espaços de endereçamento dos diferentes processos.

---

## Exercício 17

As vantagens de uma organização de **cache multinível** podem ser explicadas utilizando métricas como **hit time**, **miss rate**, **miss penalty**, **tempo médio de acesso à memória (AMAT)** e **CPI**.

Uma cache L1 normalmente possui tamanho menor e maior velocidade. Dessa forma, quando ocorre um hit na L1, o processador consegue obter o dado rapidamente.

Entretanto, quando ocorre um miss na L1, em vez de acessar diretamente a memória principal, o processador pode procurar o bloco em uma cache L2. Como a L2 é normalmente maior que a L1, existe uma grande possibilidade de o dado ser encontrado nela.

Caso também exista uma L3, o mesmo procedimento pode ocorrer novamente antes de acessar a memória principal.

O tempo médio de acesso para uma cache com dois níveis pode ser representado aproximadamente por:

$$AMAT = T_{L1} + MR_{L1}(T_{L2} + MR_{L2} \times T_{Memória})$$

Onde:

* $T_{L1}$ corresponde ao tempo de acesso à cache L1.
* $MR_{L1}$ corresponde ao miss rate da cache L1.
* $T_{L2}$ corresponde ao tempo de acesso à cache L2.
* $MR_{L2}$ corresponde ao miss rate da cache L2.
* $T_{Memória}$ corresponde à penalidade de acessar a memória principal.

Por exemplo, supondo:

$$T_{L1} = 1\ ciclo$$

$$MR_{L1} = 5\%$$

$$T_{L2} = 10\ ciclos$$

$$MR_{L2} = 10\%$$

$$T_{Memória} = 100\ ciclos$$

Temos:

$$AMAT = 1 + 0,05(10 + 0,10 \times 100)$$

$$AMAT = 1 + 0,05(20)$$

$$AMAT = 2\ ciclos$$

Se não existisse a cache L2, teríamos:

$$AMAT = 1 + 0,05 \times 100$$

$$AMAT = 6\ ciclos$$

Portanto, uma cache multinível permite combinar uma cache pequena e rápida próxima ao processador com caches maiores nos níveis seguintes, reduzindo a quantidade de acessos extremamente caros à memória principal e, consequentemente, reduzindo o tempo médio de acesso e os ciclos de stall do processador.

---

## Exercício 18

O processo de acesso à cache e à memória principal começa quando o processador gera um **endereço virtual**.

Esse endereço é dividido em uma parte que identifica a página virtual e uma parte correspondente ao deslocamento dentro dessa página:

$$Endereço\ Virtual = Página\ Virtual + Offset$$

Primeiramente, a página virtual é procurada na **TLB**, responsável por armazenar traduções utilizadas recentemente.

Caso ocorra um **TLB hit**, a página física correspondente é encontrada imediatamente. Essa página física é combinada com o offset para formar o endereço físico:

$$Endereço\ Físico = Página\ Física + Offset$$

Com o endereço físico definido, é realizado o acesso à cache.

Se ocorrer um **cache hit**, o dado solicitado é encontrado na cache e enviado ao processador.

Portanto, no melhor caso, temos:

$$TLB\ Hit \rightarrow Cache\ Hit \rightarrow CPU$$

Caso ocorra um **TLB miss**, a tradução precisa ser procurada na tabela de páginas armazenada na memória principal.

Se a página estiver presente na memória, a tradução é obtida, a TLB é atualizada e então o acesso à cache pode continuar:

$$TLB\ Miss \rightarrow Tabela\ de\ Páginas \rightarrow TLB \rightarrow Cache$$

Entretanto, se a página não estiver presente na memória principal, ocorre uma **falta de página (page fault)**. Nesse caso, o sistema operacional deve buscar a página na memória secundária, carregá-la para a memória principal, atualizar a tabela de páginas e posteriormente atualizar a TLB.

Depois que o endereço físico é obtido, ainda pode ocorrer um **cache miss**. Nesse caso, o bloco correspondente precisa ser buscado em um nível inferior da hierarquia de memória.

Em uma arquitetura com cache multinível, o fluxo pode ser:

$$L1 \rightarrow L2 \rightarrow L3 \rightarrow Memória\ Principal$$

Quando o bloco é encontrado em um nível inferior, ele é enviado aos níveis superiores e finalmente ao processador.

Dessa forma, existem diferentes possibilidades:

* **TLB hit e cache hit:** situação mais rápida, pois tanto a tradução quanto o dado estão disponíveis em estruturas rápidas.
* **TLB hit e cache miss:** a tradução é rápida, mas o dado precisa ser buscado em outro nível da hierarquia de memória.
* **TLB miss e cache hit:** é necessário inicialmente descobrir o endereço físico através da tabela de páginas antes de completar o acesso.
* **TLB miss e cache miss:** ocorre o maior custo entre os acessos comuns, pois tanto a tradução quanto o dado precisam ser buscados em estruturas mais lentas.
* **Page fault:** situação de maior penalidade, pois a página precisa ser carregada da memória secundária para a memória principal.

Portanto, a utilização conjunta da **TLB**, das **caches** e da **memória principal** cria uma hierarquia que busca reduzir o tempo médio de acesso aos dados, mantendo as informações utilizadas com maior frequência nas estruturas mais rápidas e próximas ao processador.






