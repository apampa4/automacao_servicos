class Clientes_Savon
  	$client1 = Savon.client do
		wsdl "/Users/inmetrics/Desktop/wsdls/ACIBQZBRSvalQuizE_v1_1.wsdl"
		proxy "http://proxy.santanderbr.corp:80"
		ssl_verify_mode :none
	end
	$client2 = Savon.client do
		wsdl "/Users/inmetrics/Desktop/wsdls/BuscaDatosPersona_v2_1.wsdl"
		proxy "http://proxy.santanderbr.corp:80"
		ssl_verify_mode :none
	end
end

class Rest_Post_Page_Limit
  include HTTParty

  attr_accessor :page, :limit
 
  def initialize(page, limit)
    self.page  = page
    self.limit = limit
  end

  def monta_path(servico)
	  @gw_app_key = 'gw-app-key=246d3aa0004601351bee005056906329'
	  @uri = 'https://esbapi.isbanbr.dev.corp/'
	  $path_key = (@uri + servico + @gw_app_key)
	  $path     = (@uri + servico)
  end

=begin
  def resposta_key(hash_body={})
    binding.pry
    body = ('{'+ hash_body[:page].to_s + ',' + hash_body[:limit].to_s + '}')
    puts 'body'
    puts body
    $response = self.class.post($path_key, 
      :headers => {"Content-Type" => "application/json"},
      :body => body.to_json,
      :verify => false)
  end
=end


  def resposta_key
    $response = self.class.post($path_key,
      :headers => {"Content-Type" => "application/json"},
      :body => {:page => page, :limit => limit }.to_json,
      :verify => false)
  end
end

=begin
  def resposta
    $response = self.class.post($path,
      :headers => {"Content-Type" => "application/json"},
      :body => {:page => page, :limit => limit }.to_json,
      :verify => false)
  end
=end
