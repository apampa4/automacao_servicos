#language: pt
#utf-8

Funcionalidade: Testando servico do banco em rest

Cenario: realizar o post na url do banco atraves do proxy

Dado que envie um request atras do proxy
Quando receber a resposta
Então devo ver um json como resposta