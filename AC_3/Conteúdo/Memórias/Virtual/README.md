# Arquitetura de Computadores III - Tipos de memória e suas características

## Memória Virtual

De modo geral, o tamanho da memória de um computador é projetada para atender uma determinada demanda de carga computacional em hardware, e nesse sentido, independente se a máquina pode possuir 32 MB ou 32 GB, o gerenciamento de memória será adaptado para como a máquina foi projetada.

Nesse contexto, surgem algumas questões: como rodar um programa que usa mais memória do que a quantia disponível? Como permitir que vários usuários usem o computador? Como executar vários programas ao mesmo tempo? A resposta para isso é a memória virtual.

### O que é a memória virtual

A memória virtual é uma técnica que permite ver a memória principal como uma cache de grande capacidade de armazenamento, é apenas mais um nível na hierarquia de memória. Nesse cenário, existe um mecanismo automático de gerência de memória que traz automaticamente para a memória principal os blocos de informação do disco que são necessários.

Além disso, o usuário tem a impressão de trabalhar com uma memória única do tamanho da memória secundária, mas com o tempo de acesso próxima da memória primária.

A ideia é que cada programa seja dividido um unidades chamadas de páginas. Ao realizar a execução do programa X e do programa Y, ao invés de colocar todo o X ou todo o Y na memória principal, o que é feito é basicamente colocar as páginas de ambos programas de modo que durante a execução sejam procuradas as páginas seguintes. Isso permite uma maior concorrência.

>OBS: Tempo de acesso médio = Tempo de acesso à Memória Principal + (Tempo de acesso ao disco * miss ratio)

### Diferenças entre memória virtual e cache

Aqui vão algumas diferenças entre a memória virtual e a memória cache:

- Miss penalty na memória virtual é muito maior devido ao acesso mais lento do que na cache e mais quantia de blocos a serem procurados.

- Miss ratio é bem menor do que na cache.

- Princípio da localidade opera sobre blocos maiores o que leva a maior hit ratio.

- Mapeamento totalmente associativo das páginas.

- Misses são tratados em software pois há tempo disponível.

- Write-Back é o ideal devido ao acesso mais lento.

### Mecanismo de endereçamento

Existem dois tipos de endereços, o endereço virtual que é gerado pelo programa e o endereço físico que representa a posição de fato na memória principal. Via de regra, o endereço virtual possui mais bits do que o endereço físico.

Para que seja possível gerenciar a memória e os recursos, o SO utiliza  a MMU (Memory Management Unity) que faz o mapeamento do endereço virutal para o endereço real. 

Nesse contexto, existe a paginação que é um mecanismo simples de tradução de endereços virtuais para físicos. Cada endereço é dividido em endereço da página e endereço da linha dentro da página. Além disso, quando uma página virtual não está na memória principal ocorre um page fault. Existem tabelas de endereços para fazer esse mapeamento e isso fica armazenado na memória principal.

### Gerência de processos

Cada processo na máquina possui sua própria tabela de endereços. Dessa forma, existem dois tipos de tabela, a MMTT - na memória principal, e a DMTT - no disco. A substituição de blocos podem seguir diversas formas de implementação: FIFO,L LRU, LFU e entre outras.

### Processo de busca

Inicialmente, a CPU gera um endereço que vai para a MMTT, caso ocorra um hit esse endereço é acessado na memória principal e o dado é levado à CPU, caso haja um page fault é necessário verificar na DMTT, o que leva muito mais tempo já que está no disco e, ao fim do processo, além de retornar o dado para a CPU e levá-lo à memória principal, é necessário atualizar a MMTT para utilizar dos princípios de localidade.

### Translation Look-Aside Buffer (TLB)

Para otimizar o processo de tradução de endereços, usa-se a TLB (Translation Look-Aside Buffer), que é um cache de ultravelocidade que agiliza o processo, visto que incluí páginas mais prováveis de serem acessadas. 

O endereço gerado pela CPU é procurado na TLB, se der hit acessa o dado que é enviado para a CPU, caso contrário em um miss, consulta a MMTT que se der hit atualiza a TLB de modo acelerado visto que é acesso à cache. Por fim, se der page fault, procura na DMTT realizando a atualização de tabelas.
