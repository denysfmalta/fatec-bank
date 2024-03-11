programa
{inclua biblioteca Matematica --> mat // Inclui a biblioteca MatemÃ¡tica
	
	funcao inicio()
	{real x1, y1, x2, y2, dist
		escreva("Digite o valor X do primeiro ponto: ")
		leia(x1)
		escreva("Digite o valor Y do primeiro ponto: ")
		leia(y1)
		escreva("Digite o valor X do segundo ponto: ")
		leia(x2)
		escreva("Digite o valor Y do segundo ponto: ")
		leia(y2)
		dist = mat.raiz(mat.potencia(x2-x1, 2.0) + mat.potencia(y2-y1, 2.0))
		escreva("A distancia é igual a " , mat.arredondar (dist,3))
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 459; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */