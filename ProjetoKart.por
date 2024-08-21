programa {
	inclua biblioteca Util --> u
	
	funcao cadastrarKart(inteiro &qtdTotal, cadeia &modelo[], real &valor[], inteiro &qtdLocado[], real &valorAcumulado[], inteiro &disponivel[]){
		cadeia nome
		real valorIndividual
		
		se (qtdTotal<15){
			escreva("Qual o modelo do Kart: \n")
			escreva("Modelo: ")
			leia(nome)
			modelo[qtdTotal] = nome
		
			escreva("Qual o valor do aluguel do Kart: \n")
			escreva("Valor: ")
			leia(valorIndividual)
			valor[qtdTotal] = valorIndividual
		
			qtdLocado[qtdTotal] = 0
			disponivel[qtdTotal] = 1
			valorAcumulado[qtdTotal] = 0.0
			qtdTotal++
		}senao{
			escreva(" ___________________________________________________  \n")
			escreva("|                                                   | \n")
			escreva("|   Todas as vagas de cadastro foram preenchidas!   | \n")
			escreva("|___________________________________________________| \n")
		}
	}

	funcao kartDisponiveis(inteiro qtdTotal, cadeia &modelo[], real &valor[], inteiro &qtdLocado[], real valorAcumulado[]){
		se(qtdTotal >= 1) {
			limpa()
			para(inteiro i = 0; i <= qtdTotal - 1 ; i++) {
				escreva("O modelo [", modelo[i],"] tem valor de locação de R$ ", valor[i]," alugado ", qtdLocado[i], " vezes, gerando um faturamento bruto de R$", valorAcumulado[i], "\n")
			}
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

	funcao kartLocados(inteiro qtdTotal, cadeia modelo[], inteiro disponivel[]) {
		inteiro achei = 0 
		escreva("Lista de carros locados:\n")
		se(qtdTotal == 0){
			escreva("Nenhum kart cadastrado\n")
		}
		para(inteiro i = 0; i < qtdTotal; i++) {	
			se(disponivel[i] == 0) {
				escreva("O modelo [", modelo[i], "] está locado\n")
				achei = 1
			} senao {
				se(disponivel[i] != 0 e achei == 0) {
					escreva("Nenhum modelo locado\n")
					pare
				}
			}
		}	
	}

	funcao alugarKart(inteiro qtdTotal, cadeia modelo[], real valor[], inteiro qtdLocado[], inteiro disponivel[], real &valorAcumulado[], inteiro devolvido[]) {
		inteiro numeroKart, achei = 0
		escreva("Aluguel de kart's\n")
		se(qtdTotal == 0){
			escreva("Nenhum kart cadastrado\n")
		}
		para(inteiro i = 0; i < qtdTotal; i++) {
			se(disponivel[i] == 1) {
				escreva("Escolha ", i," para alugar o kart: Modelo - [", modelo[i], "] -------- R$", valor[i], "\n")
				achei = 1
			}	
		}
		para(inteiro i = 0; i < qtdTotal; i++) {
			se(disponivel[i] != 1 e achei == 0) {
				escreva("Nenhum kart disponível para alugar\n")
				pare		
			} 
		}	
		enquanto(achei == 1) {	
			leia(numeroKart)
			se(numeroKart < qtdTotal e numeroKart >= 0 e disponivel[numeroKart] == 1){
				disponivel[numeroKart] = 0
				devolvido[numeroKart] = 0
				qtdLocado[numeroKart] = qtdLocado[numeroKart] + 1
				valorAcumulado[numeroKart] = valor[numeroKart] * qtdLocado[numeroKart]
				achei = 0
			} senao {
				escreva("Escolha um kart disponível\n")
				escreva("R: ")
			}
		}
	}

	funcao devolverKart(inteiro qtdTotal, cadeia modelo[], inteiro qtdLocado[], inteiro disponivel[], inteiro devolvido[]){
		inteiro numeroKart, achei = 0
		escreva("Devolução de kart's\n")
		se(qtdTotal == 0){
			escreva("Nenhum kart cadastrado\n")
		}
		para(inteiro i = 0; i < qtdTotal; i++) {
			se(disponivel[i] == 0) {
				escreva("Escolha ", i," para devolver o kart: Modelo - [", modelo[i],"]\n")
				achei = 1
			}	
		}
		para(inteiro i = 0; i < qtdTotal; i++) {
			se(disponivel[i] == 1 e achei == 0) {
				escreva("Nenhum kart para devolver\n")
				pare		
			} 
		}	
		enquanto(achei == 1) {	
			leia(numeroKart)
			se(numeroKart < qtdTotal e numeroKart >= 0 e disponivel[numeroKart] == 0){
				disponivel[numeroKart] = 1
				devolvido[numeroKart] = 1
				achei = 0
			} senao {
				escreva("Escolha um kart disponível\n")
				escreva("R: ")
			}
		}
	}

	funcao kartMaiorGanho(inteiro &qtdTotal, real &valorAcumulado[], cadeia modelo[], inteiro qtdLocado[]){
		inteiro indice = 0, controle = 0
		real maior = 0.0
		se (qtdTotal==0){
			escreva ("Nenhum Kart cadastrado!\n")
		}
		para (inteiro i = 0; i < qtdTotal; i++){
			se (qtdLocado [i]>=1){
				controle++
			}
		}
		se (controle>=1){
			para(inteiro i = 0; i < qtdTotal; i++){
				se(valorAcumulado[i] > maior){
					maior = valorAcumulado[i]
					indice = i
				}
			}
			escreva("O Kart que gerou mais ganhos foi o: [", modelo[indice], "], com um total de [", qtdLocado[indice] , "] vezes alugado e com um acumulo de: R$",valorAcumulado[indice], "\n")
		}
		se (controle == 0 e qtdTotal != 0){
			escreva ("Nenhum dos Karts cadastrados foi locado, portando, não temos o Kart mais lucrativo no momento.\n")
		}
	}

	funcao receitaDia(inteiro dia, real valorAcumulado[], inteiro &flag, real &valorCircuito, inteiro disponivel[], inteiro reservado){
		real total = 0.0, lucro= 0.0
		escreva("Hoje é o dia: ", dia, "\n")

		
		para(inteiro i = 0; i < 15; i++){
			total += valorAcumulado[i]
			lucro= 0.30 * total	
		}
		se (reservado==1){
			total = lucro + valorCircuito
		}senao{
			total= lucro
		}
		escreva("A receita liquida hoje é: R$", total , "\n")
	}

	funcao alugarCircuito(real &preco, inteiro &reservado, real &valorCircuito, inteiro &cadastroCircuito){
		real lucroPista = 0.0
		inteiro choice = 0
		se (cadastroCircuito == 0){
			escreva("Insira o valor que você deseja cobrar pela locação do circuito: \n")
			escreva("R: ")
			leia(preco)
			valorCircuito = preco
			cadastroCircuito++
		}
		se(reservado == 0){
			escreva("Deseja locar o circuito agora? 1 para sim ou qualquer outro valor para não: \n")
			leia(choice)
			se(choice == 1){
				se(reservado == 0 e cadastroCircuito==1){
					escreva("Reserva feita com sucesso!\n")
					valorCircuito *= 0.70
					reservado = 1
				}
			}
		}senao{
			escreva("O circuito já está reservado e por isso não pode ser alugado no momento.\n")
		}
	}

	funcao atualizarDia(real &preco, real &valorCircuito, inteiro &dia, inteiro &flag, real valorAcumulado[], inteiro &qtdLocado[], real valor[], inteiro &reservado, inteiro disponivel[], cadeia modelo[],  inteiro devolvido[]){	
		escreva("Dia: ", dia, "\n")
		escreva("O circuito está disponível para o novo dia!\n")
		para(inteiro i = 0; i < 15; i++){
			se(qtdLocado[i] > 0){
				qtdLocado[i] = qtdLocado[i] + 1
				valorAcumulado[i] = valor[i] * qtdLocado[i]
				se (disponivel [i]==0){
					escreva ("O Kart ", modelo[i], " terá uma nova cobrança de aluguel!\n")
				}
			}
			se(devolvido[i] == 1)
			{
				valorAcumulado[i] = 0.0
				qtdLocado[i] = 0
			}			
		}
		flag = 0
		dia++
		reservado = 0
		valorCircuito = preco
	}

	funcao sair(inteiro &interruptor){
		interruptor = 0
		limpa()
		escreva(" __________________________  \n")
		escreva("|                          | \n")
		escreva("|   Sistema Finalizado!!   | \n")
		escreva("|__________________________| \n")
	}

	funcao menu(
		real &preco,
		inteiro opcao,
		inteiro &interruptor,
		inteiro &qtdTotal,
		cadeia &modelo[],
		real &valor[],
		inteiro &qtdLocado[],
		real &valorAcumulado[],
		inteiro &disponivel[],
		inteiro &dia,
		inteiro &flag,
		inteiro &reservado,
		real &valorCircuito, 
		inteiro &cadastroCircuito,
		inteiro devolvido[]
		) {
			
		escolha(opcao) {
			caso 1:
				cadastrarKart(qtdTotal, modelo, valor, qtdLocado, valorAcumulado, disponivel)
				pare
			caso 2:
				kartDisponiveis(qtdTotal, modelo, valor, qtdLocado, valorAcumulado)
				u.aguarde(2000)				
				pare
			caso 3:
				kartLocados(qtdTotal, modelo, disponivel)
				u.aguarde(2000)
				pare
			caso 4:
				alugarKart(qtdTotal, modelo, valor, qtdLocado, disponivel, valorAcumulado, devolvido)
				u.aguarde(1000)
				pare
			caso 5:
				devolverKart(qtdTotal, modelo, qtdLocado, disponivel, devolvido)
				u.aguarde(1000)
				pare
			caso 6:
				kartMaiorGanho(qtdTotal, valorAcumulado, modelo, qtdLocado)
				u.aguarde(2000)
				pare
			caso 7:
				receitaDia(dia, valorAcumulado, flag, valorCircuito, disponivel, reservado)
				u.aguarde(2000)
				pare
			caso 8:
				alugarCircuito(preco, reservado, valorCircuito, cadastroCircuito)
				u.aguarde(2000)
				pare
			caso 9:
				atualizarDia(preco, valorCircuito, dia, flag, valorAcumulado, qtdLocado, valor, reservado, disponivel, modelo, devolvido)
				u.aguarde(2000)
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
		
		inteiro qtdTotal = 0 //quantidade de karts ja cadastrados
		inteiro continuar
		inteiro interruptor = 1
		inteiro dia = 1
		inteiro flag = 0
		inteiro reservado = 0
		real valorCircuito = 0.0
		inteiro cadastroCircuito = 0
		real preco = 0.0
		inteiro devolvido[15]

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
				limpa()
				menu(
					preco,
					continuar,
					interruptor,
					qtdTotal,
					modelo,
					valor,
					qtdLocado,
					valorAcumulado,
					disponivel,
					dia,
					flag,
					reservado,
					valorCircuito,
					cadastroCircuito,
					devolvido
					)
			} senao {
				limpa()
				escreva(" __________________________  \n")
				escreva("|                          | \n")
				escreva("|      Opçao Invalida!     | \n")
				escreva("|__________________________| \n")
				u.aguarde(2000)
				limpa()
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
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 7283; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11688; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
