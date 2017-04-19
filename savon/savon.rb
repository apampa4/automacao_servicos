require 'savon'
require 'rspec'
require 'cucumber'
require 'capybara/dsl'
require 'rubygems'
require 'yaml'
require 'rspec'
require 'rspec/expectations'
require 'pry'

client = Savon.client do 
	wsdl "http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?wsdl"
	pretty_print_xml true
end
=begin
puts 'operacoes do cliente'
puts ''
puts client.operations
puts ''

response = client.call(:calc_preco, message: 

	{"nCdEmpresa" => "045684", "sDsSenha" => "45685427", "nCdServico" => "40010", 
	 "sCepOrigem" => "01311200",  "sCepDestino" => "01528000", "nVlPeso" => "20", "nCdFormato" => "1", 
	 "nVlComprimento" => "16", "nVlAltura" => "2", "nVlLargura" => "11", "nVlDiametro" => "16", 
	 "sCdMaoPropria" => "s", "nVlValorDeclarado" => "20", "sCdAvisoRecebimento" => "s", 
	 "sDtCalculo" => "08/04/2017"})

puts "resposta da chamada"
puts ''
puts response
=end
#puts 'teste de leitura de arquivo'
     arquivo = File.read("XML/request.xml")
#puts arquivo 

puts 'body do xml'
request = client.build_request(:calc_preco_prazo)
puts request
puts request.body
puts 'fim do body'

puts 'testar chamada com xml'
puts ''

ret = client.call(:calc_preco_prazo, xml: arquivo)

puts "resposta da chamada em xml"
puts ''
puts ret
puts ''
puts "testes de valor de um elemento"
puts ''
@resposta = ret.body[:calc_preco_prazo_response][:calc_preco_prazo_result][:servicos][:c_servico]
@valor = @resposta [:valor]
puts "valor é #{@valor}"

#binding.pry

if @valor <= 80
	puts "valor é menor que 80"
else
	puts "valor é maior que 80"
end