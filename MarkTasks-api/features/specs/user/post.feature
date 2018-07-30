#language: pt

Funcionalidade: Cadastro
    Sendo uma aplicação que recebeu dados do usuário
    Posso solicitar uma requisição do tipo POST
    Para que os dados deste usuário sejam de fato cadastrados no sistema

    @post_200
    Cenário: Cadastro simplificado

        Dado que o usuário informou os seguintes dados:
            | name     | Diego                  |
            | email    | diegomacedo@qaninja.io |
            | password | 123456                 |
        Quando eu faço uma solicitação POST para o serviço user
        Então o código de resposta HTTP deve ser igual "200"
        E no corpo da resposta devo ver o ID do usuário

    Esquema do Cenário: Campos não enviados

        Dado que o usuário informou os seguintes dados:
            | name     | <name>     |
            | email    | <email>    |
            | password | <password> |
        Quando eu faço uma solicitação POST para o serviço user
        Então o código de resposta HTTP deve ser igual "<status_code>"
        E no corpo da resposta devo ver uma mensagem "<message>"

        Exemplos:
            | name  | email                  | password | status_code | message               |
            |       | diegomacedo@qaninja.io | 123456   | 409         | Name is required.     |
            | Diego |                        | 123456   | 409         | Email is required.    |
            | Diego | diegomacedo@qaninja.io |          | 409         | Password is required. |