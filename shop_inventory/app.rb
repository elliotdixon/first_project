require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controller/infinity_stones_controller')
require_relative('controller/manufacturer_controller')


get '/' do
  erb( :index )
end
