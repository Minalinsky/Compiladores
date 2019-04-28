# Compiladores


### Compilando:

make

./lexical < input.txt ou make run


### TODO:

~~Função principal que é chamada várias vezes;~~

Implementação da tabela de palavras reservadas;

Relatório.

**Tratar erros:**
- [ ] Símbolo não pertencente ao conjunto de símbolos
- [ ] terminais da linguagem: @";
- [x] "Identificador mal formado: j@, 1a";
- [x] "Tamanho do identificador: minha_variável_para_..."
- [x] "Número mal formado: 2.a3"
- [ ] "Fim de arquivo inesperado (comentário não fechado): {..


### Relatório Justificativas:

* Deixar o regex simples e tratar erros na análise sintática;
* Arquivo separado (main.c) para modularizar o código nas próximas etapas;
* Não retornar tokens do tipo <+, +>, retornando no formato <+, SOMA> para facilitar o entendimento;
* Erros mais específicos?
