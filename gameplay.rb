class Newgame

	def initialize
    	mainMenu(1)
  	end

  	
  	def registroCena(cena, id)
  		itens = []
  		i = 1

  		titulo = [cena[1][1]]
  		descricao = [cena[2][1]]
  		pecas = cena[3]
  		
  		while pecas[i] != nil do
  			itens[i] = pecas[i]
  			i += 1
  		end


  		puts titulo
  		puts descricao
  		
  		return itens[1]

  		#motor(titulo, descricao)
  	end

	#Seracao dos comandos para verificacao
  	def confirma_comando_use(comando)
  		lista_comando = 0
  		verificacao_comando = []

		while lista_comando <= comando[1].size
			verificacao_comando = comando[1].to_a
			if verificacao_comando[lista_comando][0] == "u"
				return 0 	
			end 
			lista_comando += 1
		end

		return 1

  	end

  	def confirma_comando_get(comando)
  		lista_comando = 0
  		verificacao_comando = []
  		
		while lista_comando <= comando[1].size
			verificacao_comando = comando[1].to_a
			if verificacao_comando[lista_comando][0] == "g"
				return 0 	
			end 
			lista_comando += 1
		end

		return 1

  	end

  	def confirma_comando_check(comando)
  		lista_comando = 0
  		verificacao_comando = []
  		
		while lista_comando <= comando[1].size
			verificacao_comando = comando[1].to_a
			if verificacao_comando[lista_comando][0] == "c"
				return 0 	
			end 
			lista_comando += 1
		end

		return 1

  	end

  	def motor(mundo, id, objetos, mochila, inventario)

  		while id < mundo.size
  			comado_terminal = []
  			texto_comando = []
  			comando_comando = []
  			objeto_comando = []
  			verificacao_comando = []
  			pecas = 0
  			itens = 0
  			lista_comando = 0

  			#chama a cena_atual
  			string_objeto_cena = registroCena(mundo[id], id)
  			
			#Acao do usuario
			comado_terminal = gets

			texto_comando = comado_terminal.to_s
			comando_comando = texto_comando.scan(/\w+/)[0]
			objeto_comando = texto_comando.scan(/\w+/)[1]



			#Escobrindo o objeto digitado
			while objeto_comando != objetos[string_objeto_cena[pecas]][2][1] 
				pecas += 1
			end	
			
			#Controle do objeto
			id_objeto = objetos[string_objeto_cena[pecas]][0][1]
			descricao_objeto = objetos[string_objeto_cena[pecas]][3]
			res_pos = objetos[string_objeto_cena[pecas]][4][1]
			res_neg = objetos[string_objeto_cena[pecas]][5]
			comando = objetos[string_objeto_cena[pecas]][6]
			cena_alvo = objetos[string_objeto_cena[pecas]][7][1] 
			
			
			#Controle do comando
			if comando_comando == "use"
				tem_comando = confirma_comando_use(comando)
				if tem_comando == 0
					puts "da pra usar"
				else
					"Execucao incorreta"
				end 


			elsif comando_comando == "get"
				tem_comando = confirma_comando_get(comando)
				
				if tem_comando == 0
					ver_iten = 0

					while ver_iten <= mochila.size
						if mochila[ver_iten] == id_objeto
							puts "Item ja se encontra no inventario"
						end
						ver_iten += 1
					end
					if ver_iten > mochila.size
						mochila[inventario] = id_objeto;
						puts res_pos
						inventario += 1
					end

					if cena_alvo != 0
						id = cena_alvo
						motor(mundo, id, objetos, mochila, inventario)
					end

				else
					"Execucao incorreta"
				end 
				
			elsif comando_comando == "check"	
				tem_comando = confirma_comando_check(comando)
				if tem_comando == 0
					puts "da pra usar"
				else
					"Execucao incorreta"
				end 
			else
				puts "comando nao encontrado"
			end
			
  		end 

  		puts "Parabens,"
  		puts "você salvou a Pedra Filosofal."
  	end

  	def registroInventario(id)
  		
  	end

	def mainMenu(iCena)
		mundo = []
		objetos = []
		mochila = []
  		itens_inventario = 0
		

		id = iCena
		iObjeto = 1

		require 'json'
		while  iCena <= 2 do
			#Leitura do arquivo das cenas
			iCena.to_s
			nomeCena = "cena"
			tipoCena = ".json"
			titulo = "#{nomeCena}#{iCena}#{tipoCena}"
			fileCena = File.read(titulo)
			data_hash_cena = JSON.parse(fileCena).to_a
			cena = data_hash_cena
			i = data_hash_cena[0]

			#Adicionando as cenas lidas no vetor
			i.to_s
	  		cena_atual = i[1].to_i	  		
	  		mundo[cena_atual] = cena

	  		#encremento das cenas
	  		iCena += 1
			
		end

		while  iObjeto <= 2 do
			#Leitura do arquivo dos objetos
			iObjeto.to_s
			nomeObjeto = "objeto"
			tipoObjeto = ".json"
			tituloObjeto = "#{nomeObjeto}#{iObjeto}#{tipoObjeto}"
			fileObjeto = File.read(tituloObjeto)
			data_hash_objeto = JSON.parse(fileObjeto).to_a
			coisa = data_hash_objeto
			j = data_hash_objeto[0]

			#Adicionando os objetos lidos no vetor
			i.to_s
	  		objeto_atual = j[1].to_i	  		
	  		objetos[objeto_atual] = coisa


	  		#encremento dos objetos
	  		iObjeto += 1
			
		end

		motor(mundo, id, objetos, mochila, itens_inventario)
		
		

end 
Newgame.new
end
