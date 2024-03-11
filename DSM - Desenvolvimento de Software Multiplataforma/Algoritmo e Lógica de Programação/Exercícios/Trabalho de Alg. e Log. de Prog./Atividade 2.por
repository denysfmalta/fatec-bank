programa
{
inclua biblioteca Matematica --> mat // Inclui a biblioteca Matemática
	
	funcao inicio()
	{
	real raio, PI = mat.PI
	
	escreva("Digite o raio: ")
	leia(raio)
	
	escreva("O volume é igual a: ", (mat.potencia(raio, 3.0) * PI) * 4/3)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 247; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */