#language: pt
#utf-8

Funcionalidade: Testando servico do correio

Cenario: Validar um request soap

Dado que eu defina um cliente
Quando realizar um request ao servico CalcPrecoPraco
Então devo receber um xml como resposta