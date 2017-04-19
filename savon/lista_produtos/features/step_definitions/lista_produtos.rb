Dado(/^que eu defina um cliente$/) do
  $arquivo1 = File.read("XML/request1.xml")
end

Quando(/^realizar um request ao servico CalcPrecoPraco$/) do
  $ini = Time.now
  #binding.pry 
  $ret = $client2.call(:consulta_penumpe, xml: $arquivo1)
  $fim = Time.now
  $time = $fim - $ini
  puts "O tempo de resposta foi de #{$time} milissegundos"
end

Então(/^devo receber um xml como resposta$/) do
  puts "hash de resposta"
	puts $ret.body
end