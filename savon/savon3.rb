require 'savon'

c = Savon.client(wsdl: "http://www.webservicex.net/CurrencyConvertor.asmx?WSDL")

arquivo = File.read("XML/request2.xml")

some_array = [1, 2, 3]
puts 'teste 0'
threads = some_array.map do |parameters|
  puts 'teste 1'
  Thread.new do
    puts 'teste 2'
    $r = c.call(:conversion_rate, xml: arquivo)
    puts 'teste 3'
    Thread.current[:value] = r.to_xml
    puts 'teste 4'
  end
  puts 'teste 5'
end
# message: {'FromCurrency' => 'EUR', 'ToCurrency' => 'CAD'})
puts 'teste do xml'
puts $r #.to_hash[:conversion_rate_response][:conversion_rate_result]
puts 'teste 6'
sleep 3 # some arbitrary timeout, giving the threads time to run
threads.each &:kill
puts 'teste 7'
values = threads.map { |thr| thr[:value] }.compact
puts 'teste 8'

#Parallel.map(["GDSSpecialReturn", "Normal", "LCCSpecialReturn"], :in_threads => 3)
#{ |promo_plan| self.search_request(promo_plan) }