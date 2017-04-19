Dado(/^que eu defina um cliente$/) do
	#declaracao do cliente
  	$client = Savon.client do 
		wsdl "http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?wsdl"
	end
	#leitura do xml copiado do soapui
	$arquivo = File.read("features/XML/request.xml")
end

Quando(/^realizar um request ao servico CalcPrecoPraco$/) do  
	#request lendo o xml e medindo o tempo de resposta
    	$ini = Time.now
    	$ret = $client.call(:calc_preco_prazo, xml: $arquivo)
        $fim = Time.now
        $time = $fim - $ini
        puts "O tempo de resposta foi de #{$time} milissegundos"
end

Então(/^devo receber um xml como resposta$/) do
  	puts "hash de resposta"
	puts $ret.body
	#declaracao do caminho para utilizar as variaveis da resposta
	$resposta = $ret.body[:calc_preco_prazo_response][:calc_preco_prazo_result][:servicos][:c_servico]
	$valor = $resposta [:valor]
	puts "valor é #{$valor}"
	#exemplo de assertivas baseadas no retorno da chamada
	$assert_valor = "77,80"
	$assert_time = 15
	expect($valor).to be < $assert_valor
	expect($time).to be < $assert_time
end