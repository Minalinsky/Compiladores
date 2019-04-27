# Compiladores


### Compilando:

flex regex.l

gcc -g main.c lex.yy.c -lfl -o nome_arquivo_saida

./nome_arquivo_saida < input.txt


### TODO:

~~Função principal que é chamada várias vezes;~~

Implementação da tabela de palavras reservadas;

Relatório.

**Tratar erros:**
- [ ] Símbolo não pertencente ao conjunto de símbolos
- [ ] terminais da linguagem: @";
- [ ] "Identificador mal formado: j@, 1a";
- [ ] "Tamanho do identificador: minha_variável_para_..."
- [ ] "Número mal formado: 2.a3"
- [ ] "Fim de arquivo inesperado (comentário não fechado): {..
