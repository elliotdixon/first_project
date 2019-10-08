require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/infinity_stone.rb')
require_relative('../models/manufacturer.rb')
also_reload('../models/*')

get '/infinity-stones' do
  @infinity_stones = InfintyStone.all()
  erb(:"infinity_stones/index")
end

get '/infinity-stones/new' do
  @manufacturers = Manufacturer.all
  erb(:"infinity_stones/new")
end

post '/infinity-stones' do
  InfintyStone.new(params).save
  redirect to '/infinity-stones'
end

get "/infinity-stones/:id" do
  @infinity_stone = InfintyStone.find(params["id"])
  erb(:"infinity_stones/show")
end

get '/infinity-stones/:id/edit' do
  @manufacturers = Manufacturer.all
  @infinity_stone = InfintyStone.find(params['id'])
  erb(:"infinity_stones/edit")
end

post '/infinity-stones/:id'do
  infinity_stone = InfintyStone.new(params)
  infinity_stone.update
  redirect to "infinity-stones/#{params['id']}"
end

post '/infinity-stones/:id/delete' do
  infinity_stone = InfintyStone.find(params['id'])
  infinity_stone.delete
  redirect to '/infinity-stones'
end
