programa
{inclua biblioteca Matematica --> mat // Inclui a biblioteca MatemÃ¡tica
	
	funcao inicio()
	{inteiro a, b, c 
	real delta, x1, x2
	


	escreva("Digite um valor para a: ")
	leia(a)
	escreva("Digite um valor para b: ")
	leia(b)
	escreva("Digite um valor para c: ")
	leia(c)

	escreva("O resultado de delta é igual a: " , mat.potencia(b,2) - 4*a*c)
	
	escreva("x1 é igual a: " , (-b + mat.raiz(delta, 2)/(2*a)))
escreva("x2 é igual a: " , (-b - mat.raiz(delta,2.0)/(2*a)))

	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 479; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */