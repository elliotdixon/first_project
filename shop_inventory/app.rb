require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controller/infinity_stones_controller')


get '/' do
  erb( :index )
end
