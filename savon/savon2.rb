require 'savon'

c = Savon.client(wsdl: "http://www.webservicex.net/CurrencyConvertor.asmx?WSDL")

arquivo = File.read("XML/request2.xml")

r = c.call(:conversion_rate, xml: arquivo)
#        message: {'FromCurrency' => 'EUR', 'ToCurrency' => 'CAD'})
puts 'teste do xml'
puts r.to_hash[:conversion_rate_response][:conversion_rate_result]

=begin

request = c.build_request(:conversion_rate)
puts 'headers'
puts request.headers
puts ''
puts 'body'
puts request.body
puts ''
puts 'r.body'
puts r.body

xml

<?xml version="1.0" encoding="UTF-8"?><env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://www.webserviceX.NET/" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/"><env:Body><tns:ConversionRate></tns:ConversionRate></env:Body></env:Envelope>

require 'savon'

client = Savon.client do 
	wsdl "http://www.webservicex.net/length.asmx?WSDL"
	pretty_puts_xml true
end

#puts client.operations
puts ''
ret = client.call(:change_length_unit, message: {"nLengthValue" => "100", "sFromLengthUnit" => "Centimeters", "sToLengthUnit" => "Meters"})
puts "resposta da chamada em xml"
puts ''
puts ret
=end