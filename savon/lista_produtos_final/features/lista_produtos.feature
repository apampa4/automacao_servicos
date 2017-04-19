#language: pt
#utf-8

Funcionalidade: Testando servico do correio

Cenario: Validar um request soap

Dado que eu receba uma lista de CPFs
Quando realizar o request para obter o PENUMPER
E realizar o request para obter a lista de produtos
Então devo gerar um arquivo com os dados de produtos dos clientes