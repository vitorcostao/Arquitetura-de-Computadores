# Resumo: Carry Lookahead Adder (CLA)

## Introdução

O **Carry Lookahead Adder (CLA)** é um circuito digital utilizado para acelerar a operação de soma binária.
Ele resolve a principal limitação do **Ripple-Carry Adder**, que depende da propagação sequencial do carry, tornando o processo lento para somas de muitos bits.

O CLA antecipa (lookahead) os valores de carry através de expressões lógicas, calculando-os em paralelo.

---

## Conceitos Fundamentais

Para cada bit da soma, temos duas funções importantes:

* **Propagate (P):**

  $$
  P_i = A_i \oplus B_i
  $$

  Indica se o carry de entrada será propagado para a próxima posição.

* **Generate (G):**

  $$
  G_i = A_i \cdot B_i
  $$

  Indica se a posição gera um carry independentemente da entrada.

---

## Equações de Carry

O carry de cada posição pode ser escrito como:

* Carry de entrada (normalmente zero):

  $$
  C_0
  $$

* Primeiros carries:

  $$
  C_1 = G_0 + (P_0 \cdot C_0)
  $$

  $$
  C_2 = G_1 + (P_1 \cdot G_0) + (P_1 \cdot P_0 \cdot C_0)
  $$

  $$
  C_3 = G_2 + (P_2 \cdot G_1) + (P_2 \cdot P_1 \cdot G_0) + (P_2 \cdot P_1 \cdot P_0 \cdot C_0)
  $$

  $$
  C_4 = G_3 + (P_3 \cdot G_2) + (P_3 \cdot P_2 \cdot G_1) + (P_3 \cdot P_2 \cdot P_1 \cdot G_0) + (P_3 \cdot P_2 \cdot P_1 \cdot P_0 \cdot C_0)
  $$

---

## Equação da Soma

A soma de cada bit é dada por:

$$
S_i = P_i \oplus C_i
$$

Ou seja, a soma depende do **propagate** e do carry calculado antecipadamente.

---

## Vantagens e Desvantagens

**Vantagens**

* Muito mais rápido que o ripple-carry.
* Cálculo paralelo dos carries.
* Essencial para CPUs e ALUs modernas.

**Desvantagens**

* Circuito mais complexo.
* Consome mais área e portas lógicas.

---

## Em suma

O **Carry Lookahead Adder** melhora a velocidade de somadores binários expandindo as equações de carry em função de sinais de *propagate* e *generate*.
Assim, elimina a espera sequencial do ripple-carry e permite cálculos muito mais rápidos em sistemas digitais.
