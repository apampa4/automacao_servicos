=begin
  document = Wasabi.document File.read("/Users/inmetrics/Desktop/wsdls/ACIBQZBRSvalQuizE_v1_1.wsdl")
  puts 'document'
  puts document
  puts 'document.endpoint'
  puts document.endpoint
  puts 'document.namespace'
  puts document.namespace
  puts 'document.soap_actions' 
  puts document.soap_actions 
  puts "*"
  endpoint1 = document.endpoint
  namespace1 = document.namespace
  $client3 = Savon.client(endpoint: endpoint1, namespace: namespace1, proxy: "http://proxy.santanderbr.corp:80")
=end

  #$client1 = Savon.client(wsdl: "http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?wsdl")

    #$client2 = Savon.client(endpoint: "http://180.102.41.85:8080/IBQZBR_ESCE/ws/IBQZBR_ValidaQuiz_Def_Listener", namespace: "http://www.isban.es/webservices/IBQZBR/Svalquiz_e/F_ibqzbr_svalquiz_e/ACIBQZBRSvalQuizE/v1")
=begin
  http://brasil.isban.dev.corp/BDPABR_ENS/ws/BDPABR_Def_Listener
  $client2 = Savon.client do
  #wsdl "/Users/inmetrics/Desktop/wsdls/ACIBQZBRSvalQuizE_v1_1.wsdl"
  #wsdl "file:/C:/Users/Marcel/Desktop/ACIBQZBRSvalQuizE/ACIBQZBRSvalQuizE_v1_1.wsdl"
  endpoint  "http://180.102.41.85:8080/IBQZBR_ESCE/ws/IBQZBR_ValidaQuiz_Def_Listener"
    namespace "http://www.isban.es/webservices/IBQZBR/Svalquiz_e/F_ibqzbr_svalquiz_e/ACIBQZBRSvalQuizE/v1"
  proxy "http://proxy.santanderbr.corp:80"
  wsse_auth "20001668", "258369", :digest
  ssl_verify_mode :none
  end
=end


{"xmlns:soapenv"=>"http://schemas.xmlsoap.org/soap/envelope/", "xmlns:v1"=>"http://www.isban.es/webservices/IBQZBR/Svalquiz_e/F_ibqzbr_svalquiz_e/ACIBQZBRSvalQuizE/v1", 
  "Header"=>[{"Security"=>[{"S12:role"=>"WSSecuritys", "SOAP-ENV:actor"=>"http://www.isban.es/soap/actor/wssecurityUserPass", "SOAP-ENV:mustUnderstand"=>"1", "xmlns:S12"=>"http://www.w3.org/2003/05/soap-envelope", "xmlns:SOAP-ENV"=>"http://schemas.xmlsoap.org/soap/envelope/", "xmlns:wsse"=>"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd", "UsernameToken"=>[{"Username"=>["20001668"], "Password"=>["258369"]}]}]}],
   "Body"=>[{"consultaPenumpe"=>[{"facade"=>"ACIBQZBRSvalQuizE", "entrada"=>[{"CPF"=>["43243030102"]}]}]}]}