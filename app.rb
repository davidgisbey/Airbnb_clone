require 'sinatra/base'
require './lib/database_connection.rb'

class Airbnb < Sinatra::Base

  Database_connection.connect

  get '/' do
    'Hello Battle!'
  end

  get '/space/add' do
    erb(:add)
  end

  post '/spaces/new' do

  end

  get '/spaces' do
    erb(:spaces)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
