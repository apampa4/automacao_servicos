Dado(/^que eu realize as chamadas$/) do
    servbanco = Rest_Post_Page_Limit.new(1,10)

    $array_servicos_com_chave = IO.readlines("fixtures/lista_servicos_com_chave.txt")
    $array_servicos_sem_chave = IO.readlines("fixtures/lista_servicos_sem_chave.txt")

=begin
	$array_servicos_com_chave.each { |x|
    servbanco.monta_path(x)
	servbanco.resposta_key(page: 1, limit: 10, state: 'SP')
	puts $response
	puts x
	puts '----------------------------------------'
    }
=end

=begin
	$array_servicos_sem_chave.each { |x|
	servbanco.monta_path(x)
	servbanco.resposta
	puts $response
	puts x
	puts '----------------------------------------'
	}
=end

	$array_servicos_com_chave.each { |x|
	servbanco.monta_path(x)
	servbanco.resposta_key
	puts $response
	puts x
	puts '----------------------------------------'
	}


#savon
	$array_cpfs = IO.readlines("fixtures/cpf.txt")

	$cliente = {}
	$array_cpfs.each { |x| 
		$arquivo1 = File.read("fixtures/request1.xml")
		$arquivo2 = Nokogiri.XML($arquivo1)
		element = $arquivo2.at('CPF')
		element.content = x
		$ini = Time.now
		$ret = $client1.call(:consulta_penumpe, xml: $arquivo2.to_xml)
	  	$fim = Time.now
	  	$time = $fim - $ini
#	  	puts "O tempo de resposta foi de #{$time} milissegundos"
	  	$path = $ret.body[:consulta_penumpe_response][:method_result]
	  	$penumpe = $path [:penumpe]
		y = x.chomp
        $cliente[y] = $penumpe
	}

	$arquivo_saida = []

  	$cliente.each {|key, value| 
		$arquivo3 = File.read("fixtures/request2.xml")
		$arquivo4 = Nokogiri.XML($arquivo3)
		element = $arquivo4.at('NRO_DE_PERSONA_BR')
		element.content = value
		$ini = Time.now
		$ret2 = $client2.call(:cons_contratos_cliente, xml: $arquivo4.to_xml)
	  	$fim = Time.now
	  	$time = $fim - $ini
	  	$path = $ret2.body[:cons_contratos_cliente_response][:method_result][:list]
	  	$item = $path[:item]

		if $item.is_a? Array
	  		$item.each {|x| 
	  			if x[:peestre_bks] == 'A' || x[:peestre_bks] == 'C' && x[:pecodpr_bks] = '22'
		  			$chave = (key + ";" + value + ";" + (x[:pecodpr_bks]) + ";" + (x[:pecodsu_bks]) + ";" + (x[:peestre_bks]) + ";")
		  			$arquivo_saida << $chave
	  			end
	  		}
		else
			    if $item[:peestre_bks] == 'A' || $item[:peestre_bks] == 'C' && $item[:pecodpr_bks] = '22'
					$chave = (key + ";" + value + ";" + ($item[:pecodpr_bks]) + ";" + ($item[:pecodsu_bks]) + ";" + ($item[:peestre_bks]) + ";")
		  			$arquivo_saida << $chave
	  			end
		end
  	}

  	IO.write("fixtures/saida.csv", $arquivo_saida.join("\n"))

end

=begin
https://esbapi.isbanbr.dev.corp/geographic-location/v1/cities?gw-app-key=246d3aa0004601351bee005056906329	"Request:

{
        ""page"":,
        ""limit"":,
        ""state"":""""
}"

"https://esbapi.isbanbr.dev.corp/partnership-management/v1/partners/products?gw-app-key=246d3aa0004601351bee005056906329
"	"""Request:

{
        """"channel"""":"""""""",
        """"productCode"""":"""""""",
        """"subproductCode"""":""""""""
}"""

https://esbapi.isbanbr.dev.corp/card-acquisition/v1/proposals/find-active-proposal?gw-app-key=088fbdc005dc0135090c0050569009ca	"Request:

{
        ""documentNumber"":""""
}"

https://esbapi.isbanbr.dev.corp/card-acquisition/v1/proposals/update?gw-app-key=088fbdc005dc0135090c0050569009ca	

	"""Request:
{        
        """"idProposal"""":"""""""",
        """"documentNumber"""":"""""""",
        """"documentType"""":"""""""",
        """"penumper"""":"""""""",
        """"quantityProposalDays"""":,
        """"status"""":"""""""",
        """"statusDescription"""":"""""""",
        """"statusMotive"""":"""""""",
        """"clientType"""":"""""""",
        """"fullName"""":"""""""",
        """"email"""":"""""""",
        """"cellphoneAreaCode"""":"""""""",
        """"cellphone"""":"""""""",
        """"profile"""":"""""""",
        """"income"""":,
        """"birthDate"""":"""""""",
        """"countryCode"""":"""""""",
        """"countryDescription"""":"""""""",
        """"stateCode"""":"""""""",
        """"stateDescription"""":"""""""",
        """"homeTown"""":"""""""",
        """"homeTownDescription"""":"""""""",
        """"nationalityCode"""":"""""""",
        """"nationalityDescription"""":"""""""",
        """"gender"""":"""""""",
        """"maritalStatusCode"""":"""""""",
        """"maritalStatusDescription"""":"""""""",
        """"spouseName"""":"""""""",
        """"dependent"""":,
        """"motherName"""":"""""""",
        """"patrimony"""":,
        """"invoiceEmail"""":"""""""",
        """"dcmFunction"""":"""""""",
        """"currentAccountInterest"""":"""""""",
        """"approvedLimit"""":,
        """"salesChannel"""":"""""""",
        """"requestingChannel"""":"""""""",
        """"priorityValue"""":,
        """"checkingAccount"""":{
                        """"entity"""":"""""""",
                        """"branchOffice"""":"""""""",
                        """"account"""":"""""""",
                        """"situation"""":""""""""
        },
        """"socialLogin"""":{
                        """"socialMediaID"""":,
                        """"fullName"""":"""""""",
                        """"email"""":"""""""",
                        """"cellphoneAreaCode"""":"""""""",
                        """"cellphone"""":""""""""
        },
        """"document"""":{
                        """"documentType"""":"""""""",
                        """"documentDescription"""":"""""""",
                        """"number"""":"""""""",
                        """"uf"""":"""""""",
                        """"ufDescription"""":"""""""",
                        """"issuerDocument"""":"""""""",
                        """"issuerDate"""":"""""""",
                        """"maturityDate"""":"""""""",
                        """"issuerCountry"""":"""""""",
                        """"issuerCountryDescription"""":""""""""
        },
        """"address"""":{
                        """"zipCode"""":"""""""",
                        """"street"""":"""""""",
                        """"neighborhood"""":"""""""",
                        """"number"""":,
                        """"stateCode"""":"""""""",
                        """"stateDescription"""":"""""""",
                        """"cityCode"""":"""""""",
                        """"cityDescription"""":"""""""",
                        """"complement"""":"""""""",
                        """"addressTypeCode"""":"""""""",
                        """"addressTypeDescription"""":
        },
        """"cardData"""":{
                        """"embossedName"""":"""""""",
                        """"invoiceMaturity"""":"""""""",
                        """"passwordsecureKey"""":"""""""",
                        """"insurance"""":"""""""",
                        """"overlimit"""":"""""""",
                        """"americanAirlines"""":"""""""",
                        """"automaticDebitIndicator"""":""""""""
        },
        """"phonePlanList"""":[{
                        """"partnerCode"""":"""""""",
                        """"partnerDescription"""":"""""""",
                        """"productCode"""":"""""""",
                        """"subproductCode"""":"""""""",
                        """"phonePlanDescription"""":"""""""",
                        """"phonePlanCode"""":"""""""",
                        """"chosenPhonePlan"""":""""""""
        }],
        """"listOffers"""":[{
                        """"productCode"""":"""""""",
                        """"subproductCode"""":"""""""",
                        """"subproductDescription"""":"""""""",
                        """"entityCode"""":"""""""",
                        """"priorityValue"""":
        }],
        """"chosenOffer"""":{
                        """"productCode"""":"""""""",
                        """"subproductCode"""":"""""""",
                        """"subproductDescription"""":"""""""",
                        """"entityCode"""":""""""""
        },
        """"career"""":{
                        """"professionCode"""":"""""""",
                        """"professionDescription"""":"""""""",
                        """"admissionalDate"""":"""""""",
                        """"roleCode"""":"""""""",
                        """"roleDescription"""":""""""""
        },
        """"education"""":{
                        """"levelCode"""":"""""""",
                        """"levelDescription"""":"""""""",
                        """"cnpj"""":"""""""",
                        """"university"""":"""""""",
                        """"courseCode"""":"""""""",
                        """"courseDescription"""":"""""""",
                        """"initialDate"""":"""""""",
                        """"finalDate"""":"""""""",
                        """"shiftCode"""":"""""""",
                        """"shiftDescription"""":""""""""
        },
        """"utmData"""":{
                        """"cp"""":"""""""",
                        """"sp"""":"""""""",
                        """"utmSource"""":"""""""",
                        """"utmMedium"""":"""""""",
                        """"utmCampaign"""":"""""""",
                        """"utmTerm"""":"""""""",
                        """"utmContent"""":"""""""",
                        """"gclid"""":""""""""
        },
        """"cmaState"""":{
                        """"decisionCode"""":,
                        """"descriptionCode"""":""""""""
        },
        """"partnerResponseList"""":[{
                        """"chosenPartner"""":"""""""",
                        """"partnerCode"""":"""""""",
                        """"partnerName"""":"""""""",
                        """"status"""":"""""""",
                        """"statusEmail"""":"""""""",
                        """"score"""":"""""""",
                        """"textInformations"""":""""""""
        }]
}
""


"

=end

