require "httparty"

class ServBanco
  include HTTParty
 
  base_uri "https://esbapi.isbanbr.dev.corp"
  http_proxy 'proxy.santanderbr.corp', 80  

  attr_accessor :page, :limit
 
  def initialize(page, limit)
    self.page  = page
    self.limit = limit
  end
 

  def resposta
    $response = self.class.post("/wcc/v1/countries?gw-app-key=13fe5bc01e970134e1a7005056906329", 
      :headers => {"Content-Type" => "application/json"},
      :body => {:page => page, :limit => limit }.to_json,
      :verify => false)
  end
end

servbanco = ServBanco.new(0,10)
servbanco.resposta
puts $response