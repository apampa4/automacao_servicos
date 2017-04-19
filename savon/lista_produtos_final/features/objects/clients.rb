class Cliente1
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