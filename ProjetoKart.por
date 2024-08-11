programa {

	funcao cadastrarKart(){
		
	}

	funcao kartDisponiveis(){
		
	}

	funcao kartLocados(){
		
	}

	funcao alugarKart(){
		
	}

	funcao devolverKart(){
		
	}

	funcao kartMaiorGanho(){
		
	}

	funcao receitaDia(){
		
	}

	funcao alugarCircuito(){
		
	}

	funcao atualizarDia(){
		
	}

	funcao menu(inteiro opcao) {
		escolha(opcao) {
			caso 1:
				cadastrarKart()
				pare
			caso 2:
				kartDisponiveis()
				pare
			caso 3:
				kartLocados()
				pare
			caso 4:
				alugarKart()
				pare
			caso 5:
				devolverKart()
				pare
			caso 6:
				kartMaiorGanho()
				pare
			caso 7:
				receitaDia()
				pare
			caso 8:
				alugarCircuito()
				pare
			caso 9:
				atualizarDia()
				pare
			caso 10:
				escreva("Obrigado Por jogar!!")
				pare
		}
	}


	funcao inicio(){
		cadeia modelo[15]
		real valor[15]
		inteiro qtdLocado[15]
		inteiro disponivel[15] // 1 = disponivel, 0 = locado
		real valorAcumulado[15]
		inteiro continuar
		
		escreva(" _______________________________________________________ \n")
		escreva("|                                                       | \n")
		escreva("| 1. Cadastrar um Kart                                  | \n")
		escreva("| 2. Listar Karts disponíveis                           | \n")
		escreva("| 3. Listar Karts locados                               | \n")
		escreva("| 4. Alugar um Kart                                     | \n")
		escreva("| 5. Devolver um Kart                                   | \n")
		escreva("| 6. Kart que mais gerou ganhos                         | \n")
		escreva("| 7. Receita e lucro do dia, considerando karts locados | \n")
		escreva("| 8. Locação de circuito                                | \n")
		escreva("| 9. Atualizar dia                                      | \n")
		escreva("| 10. Sair do programa                                  | \n")
		escreva("|_______________________________________________________| \n")
		escreva("\n")
		escreva("R: ")
		leia(continuar)
		se(continuar >= 1 e continuar <=10) {
			menu(continuar)
		} senao {
			escreva("Obrigado por jogar!!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 619; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */