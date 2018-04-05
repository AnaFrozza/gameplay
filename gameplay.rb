class Newgame

	def initialize
    	mainMenu(1)
  	end

  	
  	def registroCena(cena, id)
  		titulo = [cena[1][1]]
  		descricao = [cena[2][1]]
  		pecas = cena[3]
  		itens = []
  		i = 1
  		while pecas[i] != nil do
  			itens[i] = pecas[i]
  			i += 1
  		end
  		puts titulo
  		puts descricao


  		#motor(titulo, descricao)
  	end

  	def motor(mundo, id, objetos)
  		while id < 2#mundo.size
  			puts registroCena(mundo[id], id)

  			if objetos[1][8][1] == '0'
  				id += 1	
  			else
  				puts "Cena ainda nao concluida"
  				break
  			end


  			 	
  		end 
  	end

  	def registroInventario
  		mochila = []
  	end

	def mainMenu(iCena)
		mundo = []
		objetos = []

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

		motor(mundo, id, objetos)
		
		

end 
Newgame.new
end
