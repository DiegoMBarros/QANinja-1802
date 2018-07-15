Dado("que o usuário informou os seguintes dados:") do |table|
    @user = table.row_hash
    HTTParty.get("https://marktasks.herokuapp.com/api/reset/#{@user['email']}?clean=full")
end
  
Quando("eu faço uma solicitação POST para o serviço user") do
    #Aqui podem haver vários headers
    HTTParty.post(
        https://marktasks.herokuapp.com/api/user
        headers: {'Content-Type' => 'application/json'},
        body: @user.to_json
        )
end
  
Então("o código de resposta HTTP deve ser igual {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
end
  
Então("no corpo da resposta devo ver o ID do usuário") do
    pending # Write code here that turns the phrase above into concrete actions
end