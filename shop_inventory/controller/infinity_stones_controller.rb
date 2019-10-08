require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/infinity_stone.rb')
also_reload('../models/*')

get '/infinity-stones' do
  @infinity_stones = InfintyStone.all()
  erb(:"infinity_stones/index")
end

get '/infinity-stones/new' do
  @manufacturers = Manufacturer.all
  erb(:new)
end

post '/infinity-stones' do
  InfintyStone.new(params).save
  redirect to '/infinity-stones'
end
