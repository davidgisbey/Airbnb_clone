require 'sinatra/base'
require './lib/database_connection.rb'
require './lib/space.rb'

class Airbnb < Sinatra::Base

  Database_connection.connect

  get '/' do
    erb(:login, {:layout => true})
  end

  get '/space/add' do
    erb :add, {:layout => true}
  end

  post '/spaces/new' do

  end

  get '/spaces' do
    @spaces = Space.list
    erb(:spaces, {:layout => true})
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
