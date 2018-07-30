#language: pt

Funcionalidade: Cadastrar tarefas
    Sendo uma aplicação cliente
    Posso soliicitar requisições POST para o serviço tasks
    Para que as tarefas do usuário sejam cadastradas no sistema

    Contexto: Autenticação
        Dado que o usuário está autenticado
            | email    | diegomacedo@qaninja.io |
            | password |  123456                |
    
    @post_task
    Cenário: Nova tarefa
        E o usuário informou a seguinte tarefa
            | title   | Ler um livro de javascript |
            | dueDate | 31/03/2018                 |
            | status  | false                      |
        E o usuário tagueou esta tarefa com:
            | tag        |
            | javascript |
            | livro      |
            | leitura    |
            | estudar    |
        Quando eu faço uma solicitação POST para o serviço tasks
        Então o código de resposta HTTP deve ser igual "200"
        E esta tarefa deve ser cadastrada com sucesso