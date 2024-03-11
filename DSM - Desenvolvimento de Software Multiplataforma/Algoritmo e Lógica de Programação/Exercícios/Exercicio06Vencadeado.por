programa {
// Recebe dois números e o tipo de operação e retorna o resultado
	funcao inicio() {
	// Declarando valores
	cadeia oper
	inteiro N1, N2
	// Processo e retorno encadeado
		escreva("Escreva o primeiro valor: \n")
		leia(N1)
		escreva("Escreva a operção desejada +, -, / ou *: \n")
		leia(oper)
		escreva("Escreva o segundo valor: \n")
		leia(N2)
		se (oper == "+") {
			escreva("A soma dos números é: ", N1 + N2, ".")
		} senao se (oper == "-") {
			escreva("A subtração dos números é: ", N1 - N2, ".")
		} senao se (oper == "-") {
			escreva("A subtração dos números é: ", N1 - N2, ".")
		} senao se (oper == "/") {
			escreva("A divisão dos números é: ", N1 / N2, ".")
		} senao se (oper == "*") {
			escreva("A multiplicação dos números é: ", N1 * N2, ".")
		} senao {
			escreva("Operação inválida!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 180; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */