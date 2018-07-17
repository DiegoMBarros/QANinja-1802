Dado("que o usuário informou os seguintes dados:") do |table|
<<<<<<< HEAD
    @user = table.rows_hash
=======
    @user = table.row_hash
>>>>>>> 7523dfa0fd0e19a4606e75414ad41571c889a648
    HTTParty.get("https://marktasks.herokuapp.com/api/reset/#{@user['email']}?clean=full")
end
  
Quando("eu faço uma solicitação POST para o serviço user") do
    #Aqui podem haver vários headers
<<<<<<< HEAD
    @result = HTTParty.post(
        'https://marktasks.herokuapp.com/api/user',
        headers: { 'Content-Type' => 'application/json' },
=======
    HTTParty.post(
        https://marktasks.herokuapp.com/api/user
        headers: {'Content-Type' => 'application/json'},
>>>>>>> 7523dfa0fd0e19a4606e75414ad41571c889a648
        body: @user.to_json
        )
end
  
<<<<<<< HEAD
Então("o código de resposta HTTP deve ser igual {string}") do |status_code|
    expect(@result.response.code).to eql status_code ## -> Este comando vai testar se o código é igual ao código definido na feature
end
  
Então("no corpo da resposta devo ver o ID do usuário") do
    expect(@result.parsed_response['data']).to have_key('id')
    expect(@result.parsed_response['data']['id'].length).to eql 17
end

Então("no corpo da resposta devo ver uma mensagem {string}") do |message|
    expect(@result.parsed_response['message']).to eql message
=======
Então("o código de resposta HTTP deve ser igual {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
end
  
Então("no corpo da resposta devo ver o ID do usuário") do
    pending # Write code here that turns the phrase above into concrete actions
>>>>>>> 7523dfa0fd0e19a4606e75414ad41571c889a648
end