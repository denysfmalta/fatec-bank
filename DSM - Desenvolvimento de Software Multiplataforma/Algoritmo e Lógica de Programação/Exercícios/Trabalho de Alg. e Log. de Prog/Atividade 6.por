programa
{
	
	funcao inicio()
	{
inteiro A , B, resultado
	cadeia operador
		
		escreva("Atribua um valor para A: ")
		leia(A)
		escreva("Atribua um valor para B: ")
		leia(B)
		escreva("Escolha a operação desejada: ")
		leia(operador)
		se(operador == "+"){
			resultado = A + B
		
		escreva("O resultado é: ", (resultado))
		}
		se(operador == "-"){
			resultado = A - B
		escreva("O resultado é: ", (resultado))
		}
		se(operador == "*"){
			resultado = A * B
		
		escreva("O resultado é: ", (resultado))
		}
		se(operador == "/"){
			resultado = A / B
		escreva("O resultado é: ", (resultado))
		}
	}
	

}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 511; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */