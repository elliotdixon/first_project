require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/infinity_stone.rb')
also_reload('../models/*')

get '/infinity-stones' do
  @infinity_stones = InfintyStone.all()
  erb(:"infinity_stones/index")
end
