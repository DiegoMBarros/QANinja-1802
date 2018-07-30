Dado("que o usuário está autenticado") do |user|
    @result = HTTParty.post(
        'https://marktasks.herokuapp.com/api/login',
        headers: { 'Content-Type' => 'application/json' },
        body: user.rows_hash.to_json
        )
    @token = @result.parsed_response['data']
end
  
Dado("o usuário informou a seguinte tarefa") do |table|
   @task = table.rows_hash # -> Em caso de dúvidas, inserir "puts" antes dos @task,ou @result, para saber quais informações estão sendo geradas.
   @task['tags'] = []
end
  
Dado("o usuário tagueou esta tarefa com:") do |table|
    table.hashes.each do |t|
        @task['tags'].push(t['tag'])
    end
end
  
Quando("eu faço uma solicitação POST para o serviço tasks") do
    @result = HTTParty.post(
        'https://marktasks.herokuapp.com/api/tasks',
        headers: { 
            'Content-Type' => 'application/json',
            'X-User-Id' => @token['userId'],
            'X-Auth-Token' => @token['authToken']
         },
        body: @task.to_json
        )
end
  
Então("esta tarefa deve ser cadastrada com sucesso") do
    expect(@result.parsed_response['message']).to eql 'The task has been created.'
end