programa
{
inclua biblioteca Matematica --> mat // Inclui a biblioteca Matemática
	
	funcao inicio()
	{
	real raio, PI = mat.PI
	
	escreva("Digite o raio: ")
	leia(raio)
	escreva("A área é igual a: ",mat.arredondar(PI * mat.potencia(raio, 2.0), 2))
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 120; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */