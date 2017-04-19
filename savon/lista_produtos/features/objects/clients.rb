class Cliente1
  $client2 = Savon.client do
  wsdl "/Users/inmetrics/Desktop/wsdls/ACIBQZBRSvalQuizE_v1_1.wsdl"
  proxy "http://proxy.santanderbr.corp:80"
  ssl_verify_mode :none
  end
end