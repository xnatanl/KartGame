programa {
	inclua biblioteca Util --> u
	
	funcao cadastrarKart(inteiro &qtdTotal, cadeia &modelo[], real &valor[], inteiro &qtdLocado[], real &valorAcumulado[], inteiro &disponivel[]){
		cadeia nome
		real valorIndividual
		
		escreva("Qual o modelo do Kart: \n")
		escreva("Modelo: ")
		leia(nome)
		modelo[qtdTotal] = nome
		
		escreva("Qual o valor do aluguel do Kart: \n")
		escreva("valor: ")
		leia(valorIndividual)
		valor[qtdTotal] = valorIndividual
		
		qtdLocado[qtdTotal] = 0
		disponivel[qtdTotal] = 1
		valorAcumulado[qtdTotal] = 0.0
		qtdTotal++
	}

	funcao kartDisponiveis(inteiro qtdTotal, cadeia &modelo[], real &valor[], inteiro &qtdLocado[], real valorAcumulado[]){
		
		se(qtdTotal >= 1) {
			limpa()
			para(inteiro i = 0; i <= qtdTotal - 1 ; i++) {
				escreva ("O modelo ", modelo[i]," tem valor de locação de R$ ", valor[i]," alugado ", qtdLocado[i], " vezes, gerando um lucro total de R$ ", valorAcumulado[i], ".\n")
			}
			u.aguarde(2000)
		} senao {
			limpa()
			escreva("No momento temos ", qtdTotal, " Karts em nosso Kartodromo \n")
			escreva(" _____________________________________________________________  \n")
			escreva("|                                                             | \n")
			escreva("|        No momento temos ", qtdTotal, " Karts em nosso Kartodromo         | \n")
			escreva("|_____________________________________________________________| \n")
			escreva("\n")
		}
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

	funcao sair(inteiro &interruptor){
		interruptor = 0
		limpa()
		escreva(" __________________________  \n")
		escreva("|                          | \n")
		escreva("|   Sistema Finalizado!!   | \n")
		escreva("|__________________________| \n")
	}

	funcao menu(inteiro opcao, inteiro &interruptor, inteiro &qtdTotal, cadeia &modelo[], real &valor[], inteiro &qtdLocado[], real &valorAcumulado[], inteiro &disponivel[]) {
		escolha(opcao) {
			caso 1:
				cadastrarKart(qtdTotal, modelo, valor, qtdLocado, valorAcumulado, disponivel)
				pare
			caso 2:
				kartDisponiveis(qtdTotal, modelo, valor, qtdLocado, valorAcumulado)
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
				sair(interruptor)
				pare
		}
	}


	funcao inicio(){
		cadeia modelo[15]
		real valor[15]
		inteiro qtdLocado[15]
		inteiro disponivel[15] // 1 = disponivel, 0 = locado
		real valorAcumulado[15]
		inteiro qtdTotal = 0
		inteiro continuar
		inteiro interruptor = 1

		//modelo[0] = "Nissan"
		//valor[0] = 3000.50
		//qtdLocado[0] = 1
		//disponivel[0] = 1
		//valorAcumulado[0] = 3000.50
		//qtdTotal = 1
		
		enquanto(interruptor == 1) {
			escreva(" ________________________________________________________\n")
			escreva("|                                                        | \n")
			escreva("| 1.  Cadastrar um Kart                                  | \n")
			escreva("| 2.  Listar Karts disponíveis                           | \n")
			escreva("| 3.  Listar Karts locados                               | \n")
			escreva("| 4.  Alugar um Kart                                     | \n")
			escreva("| 5.  Devolver um Kart                                   | \n")
			escreva("| 6.  Kart que mais gerou ganhos                         | \n")
			escreva("| 7.  Receita e lucro do dia, considerando karts locados | \n")
			escreva("| 8.  Locação de circuito                                | \n")
			escreva("| 9.  Atualizar dia                                      | \n")
			escreva("| 10. Sair do programa                                   | \n")
			escreva("|________________________________________________________| \n")
			escreva("\n")
			escreva("R: ")
			leia(continuar)
			se(continuar >= 1 e continuar <=10) {
				menu(continuar, interruptor, qtdTotal, modelo, valor, qtdLocado, valorAcumulado, disponivel)
			} senao {
				sair(interruptor)
			}
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 834; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {modelo, 4, 49, 6}-{valor, 4, 65, 5}-{qtdLocado, 4, 83, 9}-{valorAcumulado, 4, 102, 14}-{disponivel, 4, 129, 10};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */