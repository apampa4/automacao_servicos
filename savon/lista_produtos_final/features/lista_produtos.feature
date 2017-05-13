#language: pt
#utf-8

Funcionalidade: Requests para obter massa de testes

@agcta
Cenario: Gerar massas de testes a partir de Agencia e Conta
Dado que eu receba uma lista de contas
Quando realizar um request para obter dados do cliente
Entao devo gerar um arquivo com dados do cliente

@cpf
Cenario: Gerar massas de testes a partir de CPF/PENUMPER
Dado que eu receba uma lista de CPFs
Quando realizar o request para obter o PENUMPER
E realizar o request para obter a lista de produtos
Então devo gerar um arquivo com os dados de produtos dos clientes