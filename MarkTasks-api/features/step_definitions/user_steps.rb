Dado("que o usuário informou os seguintes dados:") do |table|
    @user = table.rows_hash
    HTTParty.get("https://marktasks.herokuapp.com/api/reset/#{@user['email']}?clean=full")
end
  
Quando("eu faço uma solicitação POST para o serviço user") do
    #Aqui podem haver vários headers

    @result = HTTParty.post(
        'https://marktasks.herokuapp.com/api/user',
        headers: { 'Content-Type' => 'application/json' },
        body: @user.to_json
        )
end
  
Então("o código de resposta HTTP deve ser igual {string}") do |status_code|
    expect(@result.response.code).to eql status_code ## -> Este comando vai testar se o código é igual ao código definido na feature
end
  
Então("no corpo da resposta devo ver o ID do usuário") do
    expect(@result.parsed_response['data']).to have_key('id') # -> Verifica se foi gerado um ID
    expect(@result.parsed_response['data']['id'].length).to eql 17 # -> Verifica se o tamanho é igual a "17"
end

Então("no corpo da resposta devo ver uma mensagem {string}") do |message|
    expect(@result.parsed_response['message']).to eql message
end