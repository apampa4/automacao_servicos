Dado(/^que eu receba uma lista de contas$/) do
 $array_agcta = IO.readlines("fixtures/agcta.txt")
end

Quando(/^realizar um request para obter dados do cliente$/) do
  $arquivo_saida = []
  $array_agcta.each { |x| 
  	    agcta = x
		$arquivo1 = File.read("fixtures/request0.xml")
		$arquivo2 = Nokogiri.XML($arquivo1)
		element_ins = $arquivo2.at('ENTIDAD_BR')
		element_age = $arquivo2.at('SUCURSAL_BR')
		element_cta = $arquivo2.at('NRO_CUENTA_BR')
		element_ins.content = '0033'
		element_age.content = agcta.itself[0,4]
		element_cta.content = agcta.itself[4,16]
		$ini = Time.now
		$ret = $client2.call(:cons_dados_cliente, xml: $arquivo2.to_xml)
	  	$fim = Time.now
	  	$time = $fim - $ini
#	  	puts "O tempo de resposta foi de #{$time} milissegundos"
	  	$path = $ret.body[:cons_dados_cliente_response][:method_result][:data]
	  	$doc = $path [:penumdo_bks]
	  	$arquivo_saida << $doc.itself[0,11]
	} 
	binding.pry
end

Entao(/^devo gerar um arquivo com dados do cliente$/) do
  IO.write("fixtures/cpf2.txt", $arquivo_saida.join("\n"))
end