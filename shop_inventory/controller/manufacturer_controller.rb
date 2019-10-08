require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/infinity_stone.rb')
require_relative('../models/manufacturer.rb')
also_reload('../models/*')

get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb(:"manufacturers/index")
end
