programa
{
	
	funcao inicio()
	{
		inteiro n1, n2, n3, aux

		escreva("Digite o primeiro número: ")
		leia(n1)
		escreva("Digite o segundo número: ")
		leia(n2)
		escreva("Digite o terceiro número: ")
		leia(n3)

		se (n1 > n2)
		{
			aux = n2
			n2 = n1
			n1 = aux
		}
		

		se (n2 > n3)
		{
			aux = n3
			n3 = n2
			n2 = aux	
		}
		se (n1 > n2)
		{
			aux = n2
			n2 = n1
			n1 = aux
		
		}
		escreva(n3, n2, n1)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 410; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */