Dado(/^que eu receba uma lista de CPFs$/) do
  #Leitura do arquivo de CPFS
  $array_cpfs = IO.readlines("fixtures/cpf2.txt")
end

Quando(/^realizar o request para obter o PENUMPER$/) do
=begin
	Este bloco cria um hash onde a chave é o CPF e o valor é PENUMPER. 
=end
	$cliente = {}
	$array_cpfs.each { |x| 
		$arquivo1 = File.read("fixtures/request1.xml")
		$arquivo2 = Nokogiri.XML($arquivo1)
		element = $arquivo2.at('CPF')
		element.content = x
		$ini = Time.now
		$ret = $client1.call(:consulta_penumpe, xml: $arquivo2.to_xml)
	  	$fim = Time.now
	  	$time = $fim - $ini
#	  	puts "O tempo de resposta foi de #{$time} milissegundos"
	  	$path = $ret.body[:consulta_penumpe_response][:method_result]
	  	$penumpe = $path [:penumpe]
		y = x.chomp
        $cliente[y] = $penumpe
	}
end

Quando(/^realizar o request para obter a lista de produtos$/) do
	$arquivo_saida = []

  	$cliente.each {|key, value| 
		$arquivo3 = File.read("fixtures/request2.xml")
		$arquivo4 = Nokogiri.XML($arquivo3)
		element = $arquivo4.at('NRO_DE_PERSONA_BR')
		element.content = value
		$ini = Time.now
		$ret2 = $client2.call(:cons_contratos_cliente, xml: $arquivo4.to_xml)
	  	$fim = Time.now
	  	$time = $fim - $ini
	  	$path = $ret2.body[:cons_contratos_cliente_response][:method_result][:list]
	  	$item = $path[:item]

		if $item.is_a? Array
	  		$item.each {|x| 
	  			if x[:peestre_bks] == 'A' || x[:peestre_bks] == 'C' && x[:pecodpr_bks] = '22'
		  			$chave = (key + ";" + value + ";" + (x[:pecodpr_bks]) + ";" + (x[:pecodsu_bks]) + ";" + (x[:peestre_bks]) + ";")
		  			$arquivo_saida << $chave
	  			end
	  		}
		else
			    if $item[:peestre_bks] == 'A' || $item[:peestre_bks] == 'C' && $item[:pecodpr_bks] = '22'
					$chave = (key + ";" + value + ";" + ($item[:pecodpr_bks]) + ";" + ($item[:pecodsu_bks]) + ";" + ($item[:peestre_bks]) + ";")
		  			$arquivo_saida << $chave
	  			end
		end
  	}
end

Então(/^devo gerar um arquivo com os dados de produtos dos clientes$/) do
  IO.write("fixtures/saida2.csv", $arquivo_saida.join("\n"))
end