# Compiladores


### Compilando:

make

./lexical < input.txt ou make run


### TODO:

~~Função principal que é chamada várias vezes;~~

~~Implementação da tabela de palavras reservadas;~~

Relatório.

**Tratar erros:**
- [x] Símbolo não pertencente ao conjunto de símbolos
- [x] terminais da linguagem: @";
- [x] "Identificador mal formado: j@, 1a";
- [x] "Tamanho do identificador: minha_variável_para_..."
- [x] "Número mal formado: 2.a3"
- [x] "Fim de arquivo inesperado (comentário não fechado): {..


### Relatório Justificativas:

* Deixar o regex simples e tratar erros na análise sintática;
* Arquivo separado (main.c) para modularizar o código nas próximas etapas;
* Não retornar tokens do tipo <+, +>, retornando no formato <+, SOMA> para facilitar o entendimento;
* Erros mais específicos?
  - Identificar: verificado se começa com [(underscore)at#$%&]
    - Se começar com número, tratado como número mal formatado;
    - Caso o erro encontra-se no meio do identificador: test@ando
    - É retornado um identificador test e um indentificador mal formado '@'ando
    - Isso será tratado no analisador sintático;

  - Número: verifica se existe [(underscore)@#$%&a-zA-Z] em alguma parte depois de um número:
    - Caso seja um número no formto 12a ou 1a2 será retornado:
      - Será retornado um número mal formado (12a ou 1a2)
    - Caso seja um número no formto 12a.344 será retornado:
      - um número mal formatado (12a) um ponto (.) e um número inteiro (344)
      - isso será tratado no analisador sintático.
    - Caso seja um número no formato 12a.a344 será retornado:
      - um número mal formatado (12a) um ponto (.) e um identificador (a344)
      - deverá ser tratado no analisador sintático.
    - Caso seja un número no formato 12.a34 ou 12.3a4 ou 12.34a
      - Será retornado um número mal formado (12.a34 ou 12.3a4 ou 12.34a)
