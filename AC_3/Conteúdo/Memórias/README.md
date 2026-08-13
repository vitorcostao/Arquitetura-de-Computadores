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
